import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelife_app/app/data/providers/text_graphql.dart';

class HomeController extends GetxController with TextGraphQLProvider {
  final GlobalKey key = GlobalKey();
  final RxDouble height = 0.0.obs;

  @override
  void onReady() {
    // print(key.currentContext!.size!.height);
    height.value = key.currentContext?.size?.height ?? 0;

    print(height);
    print(Get.height);
    super.onReady();
  }

  double positionProgressBarPoint(double value) =>
      value * (Get.width - 64 - 24) / 10;
  double positionProgressBar(double value) =>
      value * (Get.width - 64 + 44) / 10;

  void handlePressScanQr() {}
  void handlePressVouhcer() {}
  void handlePressTopUp() {}
}
