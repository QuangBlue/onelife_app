import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelife_app/app/common/utils/utils.dart';
import 'package:onelife_app/app/data/models/me_model.dart';
import 'package:onelife_app/app/data/providers/text_graphql.dart';
import 'package:onelife_app/app/data/services/user_service.dart';

class HomeController extends GetxController with TextGraphQLProvider {
  final GlobalKey key = GlobalKey();
  final RxDouble height = 0.0.obs;

  final Rx<MeModel> me = Get.find<UserService>().me;

  @override
  void onReady() {
    height.value = key.currentContext?.size?.height ?? 0;

    super.onReady();
  }

  double positionProgressBarPoint(double value) =>
      value * (Get.width - 64 - 24) / 10;
  double positionProgressBar(double value) =>
      value * (Get.width - 64 - 24) / 10 + 22;

  void handlePressScanQr() {
    final bool checkAuth = Utils.checkIsAuth();
  }

  void handlePressVouhcer() {
    final bool checkAuth = Utils.checkIsAuth();
  }

  void handlePressTopUp() {
    final bool checkAuth = Utils.checkIsAuth();
    if (checkAuth) {
      textFunc();
    }
  }
}
