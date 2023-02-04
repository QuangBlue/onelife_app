import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_pin_code_controller.dart';

class LoginPinCodeView extends GetView<LoginPinCodeController> {
  const LoginPinCodeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginPinCodeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LoginPinCodeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
