import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService extends GetxService {
  GraphQLClient qlClient = GraphQLClient(
    link: HttpLink("https://sandbox-api-ecom.onelife.vn/v1/gateway"),
    cache: GraphQLCache(
      store: HiveStore(),
    ),
  );
}
