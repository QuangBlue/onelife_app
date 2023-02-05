// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelife_app/app/common/values/app_colors.dart';
import 'package:onelife_app/app/common/values/app_icons.dart';

import 'package:onelife_app/app/common/values/app_images.dart';
import 'package:onelife_app/app/common/widgets/custom_image.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const _AppBarSection(),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: controller.handleGetCurrentPage(),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            currentIndex: controller.currentIndexPage.value,
            onTap: controller.handleChangeIndexPage,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomImage.asset(
                    AppIcons.icWalletLine,
                    color: controller.currentIndexPage.value == 0
                        ? AppColors.primaryColor
                        : null,
                  ),
                ),
                label: 'Thẻ OneLife',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomImage.asset(
                    AppIcons.icQrCodeLine,
                    color: controller.currentIndexPage.value == 1
                        ? AppColors.primaryColor
                        : null,
                  ),
                ),
                label: 'Mã QR',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomImage.asset(
                    AppIcons.icAccountBoxLine,
                    color: controller.currentIndexPage.value == 2
                        ? AppColors.primaryColor
                        : null,
                  ),
                ),
                label: 'Tài khoản',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBarSection extends GetView<HomeController> {
  const _AppBarSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => controller.me.value.id?.isNotEmpty ?? false
              ? const CircleAvatar(
                  backgroundColor: Color(0xFF805AD5),
                  child: Text(
                    'H',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
        const Spacer(),
        GestureDetector(
          onTap: controller.handlePressScanQr,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                  spreadRadius: 4,
                  color: const Color(0xFF171916).withOpacity(0.08),
                ),
              ],
            ),
            child: Row(
              children: [
                CustomImage.asset(
                  AppImages.icScanQr,
                  color: const Color(0xFF4A5568),
                ),
                const SizedBox(
                  width: 6.5,
                ),
                const Text(
                  'Quét mã',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: controller.handlePressVouhcer,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                  spreadRadius: 4,
                  color: const Color(0xFF171916).withOpacity(0.08),
                ),
              ],
            ),
            child: Row(
              children: [
                CustomImage.asset(
                  AppImages.icVoucher,
                  color: const Color(0xFF3280F6),
                ),
                const SizedBox(
                  width: 6.5,
                ),
                const Text(
                  'Voucher',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Stack(
          children: [
            GestureDetector(
              onTap: controller.handlePressVouhcer,
              child: Container(
                margin: const EdgeInsets.only(right: 2),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                      spreadRadius: 4,
                      color: const Color(0xFF171916).withOpacity(0.08),
                    ),
                  ],
                ),
                child: CustomImage.asset(
                  AppImages.icRingBell,
                  color: const Color(0xFF4A5568),
                ),
              ),
            ),
            const Positioned(
              right: 0,
              child: SizedBox(
                width: 12,
                height: 12,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
