import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/utilities/app_util.dart';

import '../utilities/color_util.dart';
import 'loading.dart';

class AppButton extends ButtonAppButton {
  AppButton({
    Widget? child,
    String? title,
    double fontSize = 18.0,
    Color? textColor,
    Function()? onTap,
    double? height,
    double? width,
    EdgeInsets? margin,
    Color? borderColor,
    Color? backgroundColor,
    double? elevation,
    BorderRadius? borderRadius,
    bool isBusy = false,
  }) : super(
          child ??
              FittedBox(
                child: Text(
                  title ?? '',
                  style: TextStyle(
                    color: textColor ?? ColorUtil.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                  ),
                ),
              ),
          onTap: onTap,
          borderRadius: borderRadius ?? AppUtil.borderRadius10,
          backgroundColor: backgroundColor ?? ColorUtil.primaryColor,
          borderColor: borderColor,
          elevation: elevation,
          height: height,
          width: width,
          margin: margin,
          isBusy: isBusy,
        );

  factory AppButton.icon({
    required Widget icon,
    String title,
    Color textColor,
    Function() onTap,
    double height,
    double width,
    EdgeInsets margin,
    Color borderColor,
    Color backgroundColor,
    double elevation,
    BorderRadius? borderRadius,
    double? innerSpace,
    bool isBusy,
  }) = _AppButtonWithIcon;
}

class _AppButtonWithIcon extends AppButton {
  _AppButtonWithIcon({
    required Widget icon,
    String? title,
    double fontSize = 18.0,
    Color? textColor,
    Function()? onTap,
    double? height,
    double? width,
    EdgeInsets? margin,
    BorderRadius? borderRadius,
    Color? borderColor,
    Color? backgroundColor,
    double? elevation,
    double? innerSpace,
    bool isBusy = false,
  }) : super(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              if (title != null)
                SizedBox(
                  width: innerSpace ?? 7.5,
                ),
              if (title != null)
                FittedBox(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: textColor ?? ColorUtil.whiteColor,
                      fontWeight: FontWeight.w700,
                      fontSize: fontSize,
                    ),
                  ),
                ),
            ],
          ),
          onTap: onTap,
          backgroundColor: backgroundColor ?? ColorUtil.primaryColor,
          borderColor: borderColor,
          elevation: elevation,
          height: height,
          width: width,
          margin: margin,
          borderRadius: borderRadius,
          isBusy: isBusy,
        );
}

class ButtonAppButton extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? elevation;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final double? height;
  final double? width;
  final bool isBusy;

  const ButtonAppButton(
    this.child, {
    this.onTap,
    this.borderRadius,
    this.height,
    this.width,
    this.margin,
    this.borderColor,
    this.elevation,
    this.backgroundColor,
    this.isBusy = false,
  });

  @override
  Widget build(BuildContext context) {
    return isBusy
        ? Loading()
        : GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              onTap?.call();
            },
            child: Card(
              color: backgroundColor,
              elevation: backgroundColor == Colors.transparent
                  ? 0.0
                  : (elevation ?? 6.5),
              shape: RoundedRectangleBorder(borderRadius: borderRadius!),
              shadowColor: Colors.black87,
              margin: margin,
              child: Container(
                width: width ?? Get.width,
                height: height ?? 50.0,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: backgroundColor,
                  border: Border.all(
                    color: borderColor ?? Colors.transparent,
                  ),
                ),
                child: Center(
                  child: child,
                ),
              ),
            ),
          );
  }
}
