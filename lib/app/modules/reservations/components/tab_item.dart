import 'package:flutter/material.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/app/utilities/color_util.dart';

class TabItem extends StatelessWidget {
  final String title;
  final bool selected;
  final Function()? onTap;

  const TabItem({
    required this.title,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalCard(
      onTap: onTap,
      color: selected ? ColorUtil.primaryColor : ColorUtil.lightGrey,
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: Text(
          title,
          style: AppUtil.textStyle(
            fontSize: 50.sp,
            fontWeight: FontWeight.bold,
            color: selected ? ColorUtil.whiteColor : ColorUtil.primaryColor,
          ),
        ),
      ),
    );
  }
}
