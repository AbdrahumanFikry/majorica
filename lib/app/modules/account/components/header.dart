import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/services/auth_service.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/generated/l10n.dart';

class AccountHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.32,
      width: Get.width,
      color: ColorUtil.primaryColor,
      child: Obx(
        () {
          final user = AuthService.to.currentUser.value!;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user.name,
                style: AppUtil.textStyle(
                  fontSize: 60.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30.sp,
              ),
              // Text(
              //   ,
              //   style: AppUtil.textStyle(
              //     fontSize: 48.sp,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // SizedBox(
              //   height: 30.sp,
              // ),
              Text(
                '${user.points} ${S.of(context).points}',
                style: AppUtil.textStyle(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
