// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:onelife_app/app/common/values/app_images.dart';
import 'package:onelife_app/app/common/widgets/custom_image.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _AppBarSection(),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Column(
          children: const [
            _CardSection(),
            SizedBox(height: 16),
            _MemberInfo(),
          ],
        ),
      ),
    );
  }
}

class _MemberInfo extends StatelessWidget {
  const _MemberInfo();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFCBD5E0),
        ),
      ),
      child: Column(
        children: [
          const ProgressBar(),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Thêm',
                    style: TextStyle(
                      color: Color(0xFF718096),
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: ' 500.000 đ ',
                    style: TextStyle(
                      color: Color(0xFF39A26A),
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: 'để đạt OneLife Club',
                    style: TextStyle(
                      color: Color(0xFF718096),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Color(0xFFCBD5E0),
            thickness: 1,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: const [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFFE6F1FF),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Quyền lợi hạng',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
                child: VerticalDivider(
                  thickness: 1,
                  color: Color(0xFFCBD5E0),
                ),
              ),
              Row(
                children: const [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFFE6F1FF),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Đổi thưởng',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

class ProgressBar extends GetView<HomeController> {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 22,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(1),
          child: Stack(
            children: [
              Positioned(
                left: controller.positionProgressBarPoint(0),
                width: 20,
                height: 20,
                child: const TextProgressBar(text: '0'),
              ),
              Positioned(
                left: controller.positionProgressBarPoint(2),
                width: 20,
                height: 20,
                child: const TextProgressBar(text: '1tr'),
              ),
              Positioned(
                left: controller.positionProgressBarPoint(3),
                width: 24,
                height: 20,
                child: const TextProgressBar(text: '1.5tr'),
              ),
              Positioned(
                left: controller.positionProgressBarPoint(6),
                width: 20,
                height: 20,
                child: const TextProgressBar(text: '3tr'),
              ),
              Positioned(
                left: controller.positionProgressBarPoint(10),
                width: 20,
                height: 20,
                child: const TextProgressBar(text: '5tr'),
              ),
            ],
          ),
        ),
        Container(
          height: 22,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                width: controller.positionProgressBar(3),
                height: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF38A169).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Positioned(
                left: controller.positionProgressBarPoint(3),
                width: 20,
                height: 20,
                child: Container(
                  margin: const EdgeInsets.all(1.5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF38A169),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: controller.positionProgressBarPoint(0),
                width: 20,
                height: 20,
                child: const IconProgressBar(color: Color(0xFFFF7600)),
              ),
              Positioned(
                left: controller.positionProgressBarPoint(2),
                width: 20,
                height: 20,
                child: const IconProgressBar(color: Color(0xFF3280F6)),
              ),
              Positioned(
                left: controller.positionProgressBarPoint(3),
                width: 20,
                height: 20,
                child: const IconProgressBar(color: Color(0xFFD69E2E)),
              ),
              Positioned(
                left: controller.positionProgressBarPoint(6),
                width: 20,
                height: 20,
                child: const IconProgressBar(color: Color(0xFF805AD5)),
              ),
              Positioned(
                left: controller.positionProgressBarPoint(10),
                width: 20,
                height: 20,
                child: const IconProgressBar(color: Color(0xFF4A5568)),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class TextProgressBar extends StatelessWidget {
  const TextProgressBar({
    Key? key,
    required this.text,
    this.isShow = true,
  }) : super(key: key);

  final bool isShow;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        maxLines: 1,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: isShow ? const Color(0xFF718096) : Colors.transparent,
        ),
      ),
    );
  }
}

class IconProgressBar extends StatelessWidget {
  const IconProgressBar({
    super.key,
    required this.color,
    this.isShow = true,
  });

  final Color color;
  final bool isShow;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          color: isShow ? Colors.white : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: isShow ? CustomImage.asset(AppImages.kfRange) : null,
    );
  }
}

class _CardSection extends GetView<HomeController> {
  const _CardSection();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomImage.asset(
              AppImages.artboardCard,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 220,
            child: Column(
              children: const [
                _CardTop(),
                Spacer(),
                _CardBottom(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardBottom extends GetView<HomeController> {
  const _CardBottom();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Thành viên Cơ bản',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                '3.200 điểm tích lũy',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              )
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: controller.handlePressTopUp,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.add,
                    color: Color(0xFF3280F6),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Nạp tiền',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3280F6),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CardTop extends StatelessWidget {
  const _CardTop();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(8),
        ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.black.withOpacity(0.15),
            Colors.black.withOpacity(0.0),
          ],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImage.asset(
            AppImages.kfIcon,
            height: 20,
          ),
          const SizedBox(
            width: 6,
          ),
          Image.asset(
            AppImages.kfLogo,
            height: 16,
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                '500.000 đ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Hết hạn: 30/03/2025',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
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
        const CircleAvatar(
          backgroundColor: Color(0xFF805AD5),
          child: Text(
            'H',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
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
