import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelife_app/app/data/providers/auth_providers.dart';

class LoginController extends GetxController with AuthProvider {
  final TextEditingController phoneNumberController = TextEditingController();

  Future<void> handleLogin() async => await sendOtp(phoneNumberController.text);
}
