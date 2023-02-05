import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelife_app/app/data/models/send_otp_model.dart';
import 'package:onelife_app/app/data/providers/auth_providers.dart';
import 'package:onelife_app/app/modules/login_pin_code/arguments/login_pin_code_arguments.dart';
import 'package:onelife_app/app/routes/app_pages.dart';

class LoginController extends GetxController with AuthProvider {
  final TextEditingController phoneNumberController = TextEditingController();

  Future<void> handleLogin() async {
    final SendOtpModel result = await sendOtp(phoneNumberController.text);

    if (result.otpTrackingId?.isNotEmpty ?? false) {
      Get.toNamed(
        Routes.LOGIN_PIN_CODE,
        arguments: LoginPinCodeArguments(
          sendOtp: result,
          phoneNumber: phoneNumberController.text,
        ),
      );
    }
  }
}
