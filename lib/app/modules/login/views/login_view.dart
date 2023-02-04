import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onelife_app/app/common/values/app_colors.dart';
import 'package:onelife_app/app/common/values/app_images.dart';
import 'package:onelife_app/app/common/widgets/custom_image.dart';
import 'package:onelife_app/app/common/widgets/custom_text_button.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height / 14,
                  ),
                  CustomImage.asset(
                    AppImages.oneLifeLogo,
                    width: Get.width / 2,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(
                                  0xFFCBD5E0,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Center(child: Text('+84'))),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(
                                0xFFCBD5E0,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextField(
                            controller: controller.phoneNumberController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Nhập số điện thoại',
                              contentPadding: EdgeInsets.all(16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomButton(
                    onPressed: controller.handleLogin,
                    child: const Text(
                      'Tiếp tục',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      children: [
                        const Text(
                            '1 tài khoản - 1 click thanh toán - Được Freeship và nhận nhiều ưu đãi hấp dẫn với thẻ OneLife.'),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Tìm hiểu thêm',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Bằng việc ấn nút tiếp tục, bạn đông ý với các điều khoản của OneLife',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
