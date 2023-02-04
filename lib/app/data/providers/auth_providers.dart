import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:onelife_app/app/common/logger/app_logger.dart';
import 'package:onelife_app/app/data/graphql_service.dart';
import 'package:onelife_app/app/data/graphql_strings.dart';
import 'package:onelife_app/app/data/models/send_otp.dart';

class AuthProvider {
  final GraphQLClient qlClient = Get.find<GraphQLService>().qlClient;

  Future<SendOtp> sendOtp(String phoneNumber) async {
    QueryResult queryResult = await qlClient.mutate(
      MutationOptions(
          fetchPolicy: FetchPolicy.networkOnly, //
          document: gql(
            sendOtpMutation, // as tou graphql need query string
          ),
          variables: {
            "input": {
              "phone": phoneNumber,
              "captchaSignature": "",
            }
          }),
    );
    AppLogger.i(queryResult.data);

    if (queryResult.data == null) {
      Get.snackbar(
        "Đã xảy ra lỗi !",
        queryResult.exception?.graphqlErrors.first.message ?? '',
      );
    }

    final SendOtp response = SendOtp.fromJson(queryResult.data!['sendOtp']);

    AppLogger.i(response.toJson());

    return response;
  }
}
