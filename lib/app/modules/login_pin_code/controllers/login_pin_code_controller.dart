import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelife_app/app/common/storage/storage.dart';
import 'package:onelife_app/app/common/utils/utils.dart';
import 'package:onelife_app/app/common/values/constants.dart';
import 'package:onelife_app/app/data/graphql/graphql_response.dart';
import 'package:onelife_app/app/data/models/verify_otp_input_model.dart';
import 'package:onelife_app/app/data/providers/query/verify_otp_input_query.dart';
import 'package:onelife_app/app/modules/login_pin_code/arguments/login_pin_code_arguments.dart';
import 'package:onelife_app/app/routes/app_pages.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginPinCodeController extends GetxController {
  final LoginPinCodeArguments arguments =
      Get.arguments as LoginPinCodeArguments;

  final VerifyOtpInputQuery verifyOtpInputQuery = VerifyOtpInputQuery();

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
    final BaseResponse<VerifyOtpInputModel> result = await Utils.callLoading(
        verifyOtpInputQuery.verifyOtpInput(
            phoneNumber.value, pinCodeController.text));

    if (result.data != null) {
      Storage.saveValue(Constants.accessToken, result.data!.accessToken);
      Storage.saveValue(Constants.refreshToken, result.data!.refreshToken);

      Get.until((route) => route.settings.name == Routes.HOME);
    }
  }
}
