import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelife_app/app/common/storage/storage.dart';
import 'package:onelife_app/app/common/utils/utils.dart';
import 'package:onelife_app/app/common/values/constants.dart';
import 'package:onelife_app/app/data/models/verify_otp_input_model.dart';
import 'package:onelife_app/app/data/providers/auth_providers.dart';
import 'package:onelife_app/app/modules/login_pin_code/arguments/login_pin_code_arguments.dart';
import 'package:onelife_app/app/routes/app_pages.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginPinCodeController extends GetxController with AuthProvider {
  final LoginPinCodeArguments arguments =
      Get.arguments as LoginPinCodeArguments;

  final TextEditingController pinCodeController = TextEditingController();
  final StreamController<ErrorAnimationType>? errorController =
      StreamController<ErrorAnimationType>();
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  final RxString phoneNumber = "".obs;

  @override
  void onInit() {
    phoneNumber.value = arguments.phoneNumber;
    super.onInit();
  }

  Future<void> handleVerifyOtpInput() async {
    final VerifyOtpInputModel result = await Utils.callLoading(
        verifyOtpInput(phoneNumber.value, pinCodeController.text));

    if (result.accessToken != null) {
      Storage.saveValue(Constants.accessToken, result.accessToken);
      Storage.saveValue(Constants.refreshToken, result.refreshToken);

      Get.until((route) => route.settings.name == Routes.HOME);
    }

    print(Storage.getValue(Constants.accessToken));
  }
}
