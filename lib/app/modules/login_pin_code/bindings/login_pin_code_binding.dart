import 'package:get/get.dart';

import '../controllers/login_pin_code_controller.dart';

class LoginPinCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPinCodeController>(
      () => LoginPinCodeController(),
    );
  }
}
