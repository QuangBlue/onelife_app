import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:onelife_app/app/data/graphql/graphql_response.dart';
import 'package:onelife_app/app/data/graphql/graphql_service.dart';
import 'package:onelife_app/app/data/graphql/query/send_otp_string.dart';
import 'package:onelife_app/app/data/models/send_otp_model.dart';

// QueryResult queryResult = await qlClient.query(
//     QueryOptions(
//       fetchPolicy: FetchPolicy.networkOnly,
//       document: gql(
//         popularCategoryQuery,
//       ),
//     ),
//   );

class SendOtpQuery {
  final GraphQLClient qlClient = Get.find<GraphQLService>().qlClient;

  Future<BaseResponse<SendOtpModel>> sendOtp(String phoneNumber) async {
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

    if (queryResult.hasException) {
      return BaseResponse<SendOtpModel>.fromException(queryResult);
    }

    return BaseResponse<SendOtpModel>.fromJson(
      queryResult.data!['sendOtp'],
      (data) => SendOtpModel.fromJson(data),
    );
  }
}
