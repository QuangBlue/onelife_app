import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:onelife_app/app/common/values/app_colors.dart';
import 'package:onelife_app/app/common/widgets/base_footer.dart';
import 'package:onelife_app/app/common/widgets/custom_icon_button.dart';

class BaseScaffold extends StatelessWidget {
  final Widget? body;
  final AppBar? customAppBar;
  final List<Widget>? action;
  final IconData? leadingIcon;
  final Function()? onLeadingTap;
  final RxBool? showBottomNavigatorBar;
  final bool showAppBar;
  final bool automaticallyImplyLeading;
  final String title;
  final Widget? bottomNavigationBar;
  final Color backgroundColor;
  final Color appBarBackgroundColor;
  final double elevation;

  const BaseScaffold({
    Key? key,
    this.body,
    this.customAppBar,
    this.action,
    this.leadingIcon,
    this.onLeadingTap,
    this.showBottomNavigatorBar,
    this.showAppBar = false,
    this.automaticallyImplyLeading = true,
    this.title = '',
    this.bottomNavigationBar,
    this.backgroundColor = Colors.white,
    this.appBarBackgroundColor = Colors.white,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: customAppBar ??
          AppBar(
            backgroundColor: appBarBackgroundColor,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
            ),
            toolbarHeight: showAppBar ? kToolbarHeight : 0,
            foregroundColor: AppColors.black,
            leading: CustomIconButton(
              onTap: () {
                onLeadingTap?.call();
                Get.back();
              },
              icons: leadingIcon ?? Icons.arrow_back_ios_new_rounded,
            ),
            elevation: elevation,
            automaticallyImplyLeading: automaticallyImplyLeading,
          ),
      body: body,
      bottomNavigationBar: bottomNavigationBar != null
          ? Obx(
              () => AnimatedSize(
                  duration: const Duration(milliseconds: 150),
                  child: (showBottomNavigatorBar?.value ?? true.obs.value)
                      ? BaseFooter(
                          child: bottomNavigationBar,
                        )
                      : const SizedBox.shrink()),
            )
          : null,
    );
  }
}
