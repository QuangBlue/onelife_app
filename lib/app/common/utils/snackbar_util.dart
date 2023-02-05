import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelife_app/app/common/values/app_colors.dart';

abstract class SnackbarUtil {
  static showErrSnackbar(message,
      {SnackPosition snackPosition = SnackPosition.BOTTOM}) {
    Get.showSnackbar(GetSnackBar(
      duration: const Duration(seconds: 2),
      snackPosition: snackPosition,
      borderRadius: 14,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: Get.height * 0.05),
      message: message,
      backgroundColor: Colors.red,
      icon: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.error, color: Colors.white),
      ),
    ));
  }

  static showSuccessSnackbar(String message,
      {SnackPosition snackPosition = SnackPosition.BOTTOM}) {
    Get.showSnackbar(GetSnackBar(
      duration: const Duration(seconds: 2),
      snackPosition: snackPosition,
      borderRadius: 14,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: Get.height * 0.05),
      message: message,
      icon: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    ));
  }

  static showSnackbar(
      {required String message,
      Widget? icon,
      SnackPosition snackPosition = SnackPosition.BOTTOM}) {
    Get.showSnackbar(GetSnackBar(
      duration: const Duration(seconds: 2),
      snackPosition: snackPosition,
      borderRadius: 14,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: Get.height * 0.05),
      message: message,
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: icon ??
            Icon(
              Icons.check,
              color: AppColors.white,
              size: 16,
            ),
      ),
    ));
  }

  static showSnackbarWithTail(
      {required String message,
      required Widget icon,
      required Widget mainButton}) {
    Get.showSnackbar(GetSnackBar(
      duration: const Duration(seconds: 1),
      borderRadius: 14,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: Get.height * 0.05),
      message: message,
      mainButton: mainButton,
      icon: Padding(padding: const EdgeInsets.all(8.0), child: icon),
    ));
  }
}
