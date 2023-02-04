import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelife_app/app/common/values/app_colors.dart';
import 'package:onelife_app/app/common/widgets/spinkit_loading/custom_spinkit_three_fading.dart';

enum ButtonSizeEnum { LARGE, MEDIUM, SMALL }

extension ButtonSizeExtension on ButtonSizeEnum {
  double getValue() {
    switch (this) {
      case ButtonSizeEnum.LARGE:
        return 48;
      case ButtonSizeEnum.MEDIUM:
        return 40;
      case ButtonSizeEnum.SMALL:
        return 32;
    }
  }
}

abstract class BaseButton extends StatefulWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color? primaryColor;
  final Function()? onPressed;
  final bool showLoading;
  final double? width;
  final double? radius;
  final EdgeInsets? padding;
  final ButtonSizeEnum buttonSize;

  const BaseButton({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.primaryColor,
    this.showLoading = false,
    this.width,
    this.radius,
    this.padding,
    this.onPressed,
    this.buttonSize = ButtonSizeEnum.LARGE,
  }) : super(key: key);

  @override
  State<BaseButton> createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton> {
  Color? _backgroundColor;

  Color? _primaryColor;
  Color? _onSurfaceColor;

  double? _width;
  double? _radius;
  EdgeInsets? _padding;

  bool isLoading = false;

  Future<void> _loadingFunction() async {
    setState(() {
      isLoading = true;
    });
    await widget.onPressed?.call();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    _backgroundColor = widget.onPressed != null
        ? widget.backgroundColor ?? AppColors.primaryColor
        : AppColors.primaryColorWithOpacity;
    _primaryColor = widget.primaryColor ?? AppColors.white;
    _onSurfaceColor = AppColors.primaryColor;
    _width = widget.width ?? Get.width;
    _radius = widget.radius ?? 4;
    _padding = widget.padding ?? EdgeInsets.zero;

    return IgnorePointer(
      ignoring: isLoading,
      child: SizedBox(
        width: _width,
        height: widget.buttonSize.getValue(),
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: _primaryColor,
            padding: _padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_radius!),
            ),
            disabledForegroundColor: _onSurfaceColor!.withOpacity(0.38),
            backgroundColor: _backgroundColor,
            alignment: Alignment.center,
          ),
          onPressed: widget.onPressed != null
              ? widget.showLoading
                  ? _loadingFunction
                  : widget.onPressed
              : null,
          child: isLoading
              ? CustomSpinKitThreeFading(
                  color: AppColors.white,
                  size: 12,
                )
              : widget.child,
        ),
      ),
    );
  }
}

class CustomButton extends BaseButton {
  CustomButton.text({
    super.key,
    Color? backgroundColor,
    Color? primaryColor,
    Function()? onPressed,
    required String title,
    TextStyle? style,
    double? width,
    double? radius,
    EdgeInsets? padding,
    bool showLoading = false,
    ButtonSizeEnum buttonSize = ButtonSizeEnum.LARGE,
  }) : super(
          child: Text(
            title,
            style: style,
          ),
          width: width,
          onPressed: onPressed,
          radius: radius,
          primaryColor: primaryColor,
          backgroundColor: backgroundColor,
          showLoading: showLoading,
          padding: padding,
          buttonSize: buttonSize,
        );

  const CustomButton({
    super.key,
    Color? backgroundColor,
    Color? primaryColor,
    required Function() onPressed,
    required Widget child,
    TextStyle? style,
    double? width,
    double? radius,
    EdgeInsets? padding,
    bool showLoading = false,
    ButtonSizeEnum buttonSize = ButtonSizeEnum.LARGE,
  }) : super(
          child: child,
          width: width,
          radius: radius,
          onPressed: onPressed,
          primaryColor: primaryColor,
          backgroundColor: backgroundColor,
          showLoading: showLoading,
          padding: padding,
          buttonSize: buttonSize,
        );
}
