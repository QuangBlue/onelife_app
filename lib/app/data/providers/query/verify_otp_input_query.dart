import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:onelife_app/app/data/graphql/graphql_response.dart';
import 'package:onelife_app/app/data/graphql/graphql_service.dart';
import 'package:onelife_app/app/data/graphql/query/verify_otp_input_string.dart';
import 'package:onelife_app/app/data/models/verify_otp_input_model.dart';

class VerifyOtpInputQuery {
  final GraphQLClient qlClient = Get.find<GraphQLService>().qlClient;

  Future<BaseResponse<VerifyOtpInputModel>> verifyOtpInput(
      String phoneNumber, String pinCode) async {
    QueryResult queryResult = await qlClient.mutate(
      MutationOptions(
          fetchPolicy: FetchPolicy.networkOnly, //
          document: gql(
            verifyOtpInputMutation, // as tou graphql need query string
          ),
          variables: {
            "input": {
              "phone": phoneNumber,
              "code": pinCode,
            }
          }),
    );

    if (queryResult.hasException) {
      return BaseResponse<VerifyOtpInputModel>.fromException(queryResult);
    }

    return BaseResponse<VerifyOtpInputModel>.fromJson(
      queryResult.data!['verifyOtp'],
      (data) => VerifyOtpInputModel.fromJson(data),
    );
  }
}
