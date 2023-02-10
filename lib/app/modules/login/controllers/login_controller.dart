import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelife_app/app/data/graphql/graphql_response.dart';
import 'package:onelife_app/app/data/models/send_otp_model.dart';
import 'package:onelife_app/app/data/providers/query/send_otp_query.dart';
import 'package:onelife_app/app/modules/login_pin_code/arguments/login_pin_code_arguments.dart';
import 'package:onelife_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController phoneNumberController = TextEditingController();

  final SendOtpQuery sendOtpQuery = SendOtpQuery();

  Future<void> handleLogin() async {
    final BaseResponse<SendOtpModel> result =
        await sendOtpQuery.sendOtp(phoneNumberController.text);

    if (result.data != null) {
      Get.toNamed(
        Routes.LOGIN_PIN_CODE,
        arguments: LoginPinCodeArguments(
          sendOtp: result.data!,
          phoneNumber: phoneNumberController.text,
        ),
      );
    }
  }
}
