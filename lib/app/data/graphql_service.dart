import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:onelife_app/app/common/storage/storage.dart';
import 'package:onelife_app/app/common/values/constants.dart';

class GraphQLService extends GetxService {
  late final ValueNotifier<GraphQLClient> client;

  var httpLink = HttpLink('https://sandbox-api-ecom.onelife.vn/v1/gateway',
      defaultHeaders: {
        'Authorization': 'Bearer ${Storage.getValue(Constants.tokenKey)}',
      });

  @override
  void onInit() {
    client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        cache: GraphQLCache(),
        link: httpLink,
      ),
    );
    super.onInit();
  }
}
