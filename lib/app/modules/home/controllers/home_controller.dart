import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelife_app/app/common/utils/utils.dart';
import 'package:onelife_app/app/data/models/me_model.dart';
import 'package:onelife_app/app/data/services/user_service.dart';
import 'package:onelife_app/app/modules/home/views/widgets/body_account.dart';
import 'package:onelife_app/app/modules/home/views/widgets/body_home.dart';
import 'package:onelife_app/app/modules/home/views/widgets/body_qr.dart';

class HomeController extends GetxController {
  final GlobalKey key = GlobalKey();
  final RxDouble height = 0.0.obs;
  final RxInt currentIndexPage = 0.obs;

  final Rx<MeModel> me = Get.find<UserService>().me;

  @override
  void onInit() {
    height.value = key.currentContext?.size?.height ?? 0;

    super.onInit();
  }

  final List<Widget> page = [
    const BodyHome(),
    const BodyQr(),
    const BodyAccount(),
  ];

  void handleChangeIndexPage(int index) {
    currentIndexPage.value = index;
  }

  Widget handleGetCurrentPage() {
    return page.elementAt(currentIndexPage.value);
  }

  double positionProgressBarPoint(double value) =>
      value * (Get.width - 64 - 24) / 10;
  double positionProgressBar(double value) =>
      value * (Get.width - 64 - 24) / 10 + 21;

  void handlePressScanQr() {
    final bool checkAuth = Utils.checkIsAuth();
  }

  void handlePressVouhcer() {
    final bool checkAuth = Utils.checkIsAuth();
  }

  void handlePressTopUp() {
    final bool checkAuth = Utils.checkIsAuth();
  }
}
