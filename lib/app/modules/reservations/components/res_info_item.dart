import 'package:flutter/material.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResInfoItem extends StatelessWidget {
  final String title;
  final String info;

  const ResInfoItem({required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppUtil.textStyle(
            fontSize: 40.sp,
            fontWeight: FontWeight.w500,
            color: ColorUtil.mediumGrey,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          info,
          style: AppUtil.textStyle(
            fontSize: 38.sp,
            fontWeight: FontWeight.w700,
            color: ColorUtil.blackColor,
          ),
        ),
      ],
    );
  }
}
