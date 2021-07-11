import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';

class MajoricaCard extends GlobalCard {
  MajoricaCard({
    Widget? child,
    String? title,
    double fontSize = 18.0,
    Color? textColor,
    Function()? onTap,
    EdgeInsets? margin,
    Color? backgroundColor,
    double? elevation,
    BorderRadius? borderRadius,
  }) : super(
          child: child ??
              FittedBox(
                child: Text(
                  title ?? '',
                  style: TextStyle(
                    color: textColor ?? ColorUtil.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                  ),
                ),
              ),
          onTap: onTap,
          borderRadius: borderRadius ?? AppUtil.borderRadius10,
          color: backgroundColor ?? ColorUtil.primaryColor,
          elevation: elevation,
          margin: margin,
        );
}

class GlobalCard extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? elevation;

  const GlobalCard({
    required this.child,
    this.onTap,
    this.borderRadius,
    this.color,
    this.margin,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? AppUtil.borderRadius10,
        ),
        color: color ?? ColorUtil.lightGrey,
        margin: margin ?? EdgeInsets.zero,
        elevation: margin != null ? elevation : 0.0,
        shadowColor: Colors.black54,
        child: child,
      ),
    );
  }
}
