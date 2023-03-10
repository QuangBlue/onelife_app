import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onelife_app/app/common/values/app_colors.dart';
import 'package:onelife_app/app/common/values/app_images.dart';
import 'package:onelife_app/app/common/widgets/base_scaffold.dart';
import 'package:onelife_app/app/common/widgets/custom_image.dart';
import 'package:onelife_app/app/common/widgets/custom_text_button.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showAppBar: true,
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
                          hintText: 'Nh???p s??? ??i???n tho???i',
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
                showLoading: true,
                child: const Text(
                  'Ti???p t???c',
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
                        '1 t??i kho???n - 1 click thanh to??n - ???????c Freeship v?? nh???n nhi???u ??u ????i h???p d???n v???i th??? OneLife.'),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'T??m hi???u th??m',
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
                'B???ng vi???c ???n n??t ti???p t???c, b???n ????ng ?? v???i c??c ??i???u kho???n c???a OneLife',
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
