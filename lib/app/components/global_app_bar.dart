import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';

class GlobalAppBar extends AppBar {
  GlobalAppBar({
    String? title,
    Widget? child,
    Widget? leading,
    List<Widget>? actions,
    Color? backgroundColor,
    double elevation = 0.0,
    bool centerTitle = true,
    bool enableBack = false,
    PreferredSizeWidget? bottom,
    Function()? onCancel,
  }) : super(
          backgroundColor: backgroundColor ?? Colors.transparent,
          elevation: elevation,
          title: child ??
              FittedBox(
                child: Text(
                  title!,
                  style: AppUtil.textStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                    color: backgroundColor == ColorUtil.primaryColor
                        ? ColorUtil.whiteScaffold
                        : ColorUtil.primaryColor,
                  ),
                ),
              ),
          centerTitle: centerTitle,
          leading: enableBack
              ? IconButton(
                  padding: const EdgeInsets.all(10.0),
                  onPressed: () {
                    Get.back();
                    onCancel!.call();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: backgroundColor == ColorUtil.primaryColor
                        ? ColorUtil.whiteScaffold
                        : ColorUtil.primaryColor,
                  ),
                )
              : leading,
          actions: actions ?? <Widget>[],
          automaticallyImplyLeading: enableBack,
          bottom: bottom,
        );
}
