// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelife_app/app/common/values/app_colors.dart';
import 'package:onelife_app/app/common/values/app_icons.dart';

import 'package:onelife_app/app/common/values/app_images.dart';
import 'package:onelife_app/app/common/widgets/custom_image.dart';
import 'package:onelife_app/app/common/widgets/custom_text_button.dart';
import 'package:onelife_app/app/common/widgets/unordered.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

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
      body: SlidingUpPanel(
        minHeight:
            controller.me.value.id?.isNotEmpty ?? false ? Get.height - 560 : 0,
        maxHeight:
            Get.height - (MediaQuery.of(context).padding.top + kToolbarHeight),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 4.0,
            color: Colors.black.withOpacity(0.05),
          )
        ],
        borderRadius: BorderRadius.circular(10),
        panelBuilder: () => SingleChildScrollView(
          child: Column(
            children: [
              // HEADER
              Container(
                height: 4,
                width: 50,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCE3E8),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),

              // SEARCH - FILLTER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Lịch sử',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF718096),
                      ),
                    ),
                    Row(
                      children: [
                        CustomImage.asset(
                          AppImages.fillter,
                          color: const Color(0xFF3280F6),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'Lọc (1)',
                          style: TextStyle(
                            color: Color(0xFF3280F6),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              // TAB
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFE2E8F0),
                          width: 1.0,
                        ),
                      )),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TabBar(
                          indicatorColor: Color(0xFF3280F6),
                          labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          labelColor: Color(0xFF3280F6),
                          unselectedLabelColor: Color(0xFF5F6368),
                          tabs: [
                            Tab(text: 'Tất cả'),
                            Tab(text: 'Giao dịch'),
                            Tab(text: 'Nạp thẻ'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Column(
            key: controller.key,
            children: const [
              _CardSection(),
              SizedBox(height: 16),
              _MemberInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

class _MemberInfo extends GetView<HomeController> {
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
          controller.me.value.id?.isNotEmpty ?? false
              ? const _DescriptionForMember()
              : const _DescriptionForNonMember(),
          const Divider(
            color: Color(0xFFCBD5E0),
            thickness: 1,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  CustomImage.asset(
                    AppIcons.icVipDiamond,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImage.asset(
                    AppIcons.icVipCrown,
                    color: AppColors.yellow,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
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

class _DescriptionForNonMember extends GetView<HomeController> {
  const _DescriptionForNonMember();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Text(
            'Tham gia chương trình thành viên khi thanh toán bằng Thẻ OneLife - Kingfoodmart',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const UnorderedList([
            'Hưởng Freeship khi dùng App',
            'x2, x3, x4, x5 tích điểm tùy hạng',
            'Ưu đãi đặc quyền cho từng hạng'
          ]),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Chương trình hạng thành viên chỉ áp dụng cho KH thanh toán bằng Thẻ OneLife - Kingfoodmart',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(
            height: 8,
          ),
          CustomButton.text(
              onPressed: controller.handlePressTopUp, title: 'Nạp tiền vào Thẻ')
        ],
      ),
    );
  }
}

class _DescriptionForMember extends StatelessWidget {
  const _DescriptionForMember();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(1),
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Positioned(
                top: 0,
                left: controller.positionProgressBarPoint(8) - 46,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    'x5 tích điểm, ...',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 6,
                left: controller.positionProgressBarPoint(8) - 8,
                child: Icon(
                  Icons.arrow_drop_down_sharp,
                  color: AppColors.primaryColor,
                  size: 38,
                ),
              ),
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
                width: controller.positionProgressBar(8),
                height: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF38A169).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Positioned(
                left: controller.positionProgressBarPoint(8),
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
        ),
        Container(
          height: 20,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(1),
          child: Stack(
            children: [
              Positioned(
                left: controller.positionProgressBarPoint(7) + 20,
                height: 20,
                child: Text(
                  'Bạch kim',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
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
          Obx(
            () => controller.me.value.id?.isNotEmpty ?? false
                ? Column(
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
                  )
                : const SizedBox.shrink(),
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

class _CardTop extends GetView<HomeController> {
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
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  controller.me.value.id?.isNotEmpty ?? false
                      ? '500.000 đ'
                      : '0 đ',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                controller.me.value.id?.isNotEmpty ?? false
                    ? const Text(
                        'Hết hạn: 30/03/2025',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
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
