import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:majorica/generated/l10n.dart';

import 'app_button.dart';

class EmptyWidget extends StatelessWidget {
  final String? hint;
  final Function()? extraFunction;

  const EmptyWidget({
    this.hint,
    this.extraFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Lottie.asset(
                PathUtil.emptyLottie,
                width: 500.w,
                height: 500.w,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              S.of(context).noData,
              style: TextStyle(
                fontSize: 60.sp,
                fontWeight: FontWeight.bold,
                color: ColorUtil.errorColor,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              hint ?? '',
              style: TextStyle(
                fontSize: 48.sp,
                fontWeight: FontWeight.w700,
                color: ColorUtil.mediumGrey,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            if (extraFunction != null && hint == S.current.socketException)
              AppButton.icon(
                width: 750.w,
                icon: const Icon(
                  Icons.refresh_outlined,
                  color: ColorUtil.whiteColor,
                  size: 22.0,
                ),
                title: S.of(context).retry,
                onTap: extraFunction!,
              ),
          ],
        ),
      ),
    );
  }
}
