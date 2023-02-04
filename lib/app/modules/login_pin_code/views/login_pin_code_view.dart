import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onelife_app/app/common/values/app_colors.dart';
import 'package:onelife_app/app/common/widgets/base_scaffold.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/login_pin_code_controller.dart';

class LoginPinCodeView extends GetView<LoginPinCodeController> {
  const LoginPinCodeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showAppBar: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Nhập mã OTP',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
                'Nhập mã gồm 6 chữ số đã gửi đến số điện thoại ${controller.phoneNumber}'),
            const SizedBox(
              height: 32,
            ),
            Form(
              key: controller.formKey,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    blinkWhenObscuring: false,
                    animationType: AnimationType.fade,
                    autoFocus: true,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldWidth: 50,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveColor: AppColors.grey,
                      activeColor: AppColors.grey,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    errorAnimationController: controller.errorController,
                    controller: controller.textEditingController,
                    keyboardType: TextInputType.number,

                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  )),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Bạn chưa nhận được mã ?'),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'Gửi lại',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
