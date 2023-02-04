import 'package:flutter/material.dart';
import 'package:onelife_app/app/common/widgets/custom_image.dart';

class CustomIconButton extends StatelessWidget {
  final Function() onTap;
  final IconData icons;
  final EdgeInsets padding;
  final double radius;
  final double size;
  final Color? color;
  final Color? backgroundColor;

  const CustomIconButton({
    Key? key,
    required this.onTap,
    required this.icons,
    this.padding = const EdgeInsets.all(16),
    this.radius = 100,
    this.size = 24,
    this.color,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: backgroundColor,
          ),
          child: Icon(icons)),
    );
  }
}
