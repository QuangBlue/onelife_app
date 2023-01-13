import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:onelife_app/app/data/graphql_service.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: Get.find<GraphQLService>().client,
      child: CacheProvider(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('HomeView'),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              children: [
                const Text(
                  'HomeView is working',
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(onPressed: () {}, child: const Text('GraphQL Test'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
