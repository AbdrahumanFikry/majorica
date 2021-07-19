import 'package:flutter/material.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoLine extends StatelessWidget {
  final String title;
  final String info;
  final bool mini;
  final bool highLight;

  const InfoLine({
    required this.title,
    required this.info,
    this.mini = false,
    this.highLight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Text(
            '$title : ',
            style: AppUtil.textStyle(
              color: ColorUtil.blackColor,
              fontSize: mini ? 34.sp : 44.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Text(
              info,
              style: AppUtil.textStyle(
                color: highLight ? ColorUtil.errorColor : ColorUtil.darkBlue,
                fontSize: mini ? 34.sp : 44.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
