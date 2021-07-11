import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/app/utilities/color_util.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final String? title;
  final Color? backgroundColor;
  final Color? titleColor;
  final double? top;
  final double? right;
  final double? left;
  final double? radius;

  const Badge({
    this.title,
    required this.child,
    this.backgroundColor,
    this.titleColor,
    this.top,
    this.right,
    this.radius,
    this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (title != null)
          Positioned(
            top: top ?? 7.0,
            right: right ?? 2.0,
            left: left,
            child: Card(
              elevation: 5.0,
              shape: const CircleBorder(),
              child: CircleAvatar(
                radius: radius ?? 25.w,
                backgroundColor: backgroundColor ?? ColorUtil.errorColor,
                child: FittedBox(
                  child: Text(
                    title!,
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: titleColor ?? ColorUtil.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
