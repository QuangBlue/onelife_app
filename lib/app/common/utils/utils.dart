import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelife_app/app/common/values/app_colors.dart';
import 'package:onelife_app/app/data/services/user_service.dart';
import 'package:onelife_app/app/routes/app_pages.dart';

abstract class Utils {
  static bool checkIsAuth() {
    final bool result =
        Get.find<UserService>().me.value.id?.isNotEmpty ?? false;

    if (!result) {
      Get.toNamed(Routes.LOGIN);
    }

    return result;
  }

  static void loadingDialog() {
    if (Get.isDialogOpen == true) return;

    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
      useSafeArea: false,
      barrierColor: AppColors.white,
    );
  }

  static void closeDialog() {
    if (Get.isDialogOpen == true) Get.back();
  }

  static Future<T> callLoading<T>(Future<T> future) async {
    loadingDialog();
    try {
      return await future;
    } finally {
      closeDialog();
    }
  }
}
