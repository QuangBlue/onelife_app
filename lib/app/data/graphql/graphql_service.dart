import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:onelife_app/app/common/storage/storage.dart';
import 'package:onelife_app/app/common/values/constants.dart';

class GraphQLService extends GetxService {
  GraphQLClient qlClient = GraphQLClient(
    link: HttpLink(
      "https://sandbox-api-ecom.onelife.vn/v1/gateway",
      defaultHeaders: <String, String>{
        'Authorization': 'Bearer ${Storage.getValue(Constants.accessToken)}',
      },
    ),
    cache: GraphQLCache(
      store: HiveStore(),
    ),
  );
}
