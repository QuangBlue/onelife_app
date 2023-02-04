import 'package:flutter/material.dart';
import 'package:onelife_app/app/common/values/app_colors.dart';

class BaseFooter extends StatelessWidget {
  final Widget? child;
  final bool showShadow;
  final EdgeInsets? padding;

  const BaseFooter({Key? key, this.child, this.showShadow = true, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double paddingBottom = MediaQuery.of(context).viewPadding.bottom;

    /// Padding bottom for devices with physical button.
    if (paddingBottom <= 0) paddingBottom = 12;
    return Container(
      padding: padding ??
          EdgeInsets.fromLTRB(
            16,
            12,
            16,
            paddingBottom,
          ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: showShadow
            ? [
                BoxShadow(
                    offset: const Offset(0, -4),
                    blurRadius: 48,
                    color: AppColors.black.withOpacity(0.1))
              ]
            : null,
      ),
      child: child,
    );
  }
}
