import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class BaseImage extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final BoxShape shape;

  const BaseImage(
    this.child, {
    super.key,
    this.backgroundColor,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: shape,
      ),
      padding: padding,
      margin: margin,
      child: child,
    );
  }
}

class CustomImage extends BaseImage {
  CustomImage.asset(
    String asset, {
    super.key,
    double? width,
    double? height,
    Color? color,
    Color? backgroundColor,
    EdgeInsets padding = EdgeInsets.zero,
    margin = EdgeInsets.zero,
    shape = BoxShape.rectangle,
    BoxFit fit = BoxFit.contain,
  }) : super(
          asset.contains('svg')
              ? SvgPicture.asset(
                  asset,
                  width: width,
                  height: height,
                  color: color,
                  fit: fit,
                )
              : Image.asset(
                  asset,
                  width: width,
                  height: height,
                  color: color,
                  fit: fit,
                ),
          backgroundColor: backgroundColor,
          padding: padding,
          margin: margin,
          shape: shape,
        );

  CustomImage.network(
    String url, {
    super.key,
    double? width,
    double? height,
    Color? color,
    Color? backgroundColor,
    EdgeInsets padding = EdgeInsets.zero,
    margin = EdgeInsets.zero,
    shape = BoxShape.rectangle,
    BoxFit fit = BoxFit.contain,
  }) : super(
          url.contains('svg')
              ? SvgPicture.network(
                  url,
                  width: width,
                  height: height,
                  color: color,
                  fit: fit,
                )
              : CachedNetworkImage(
                  imageUrl: url,
                  width: width,
                  height: height,
                  color: color,
                  fit: fit,
                ),
          backgroundColor: backgroundColor,
          padding: padding,
          margin: margin,
          shape: shape,
        );
}
