import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelife_app/app/modules/login_pin_code/arguments/login_pin_code_arguments.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginPinCodeController extends GetxController {
  final arguments = Get.arguments as LoginPinCodeArguments;

  final TextEditingController textEditingController = TextEditingController();
  final StreamController<ErrorAnimationType>? errorController =
      StreamController<ErrorAnimationType>();
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  final RxString phoneNumber = "".obs;
}
