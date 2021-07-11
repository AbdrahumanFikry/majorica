import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/app/components/extensions.dart';

class PeriodComponent extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  const PeriodComponent({
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CircleAvatar(
                radius: 25.sp,
                backgroundColor: ColorUtil.primaryColor,
              ),
            ),
            Expanded(
              child: Text(
                startDate.toLongUserString(),
                style: AppUtil.textStyle(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: true,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10 + 25.sp, vertical: 5.0),
          child: FDottedLine(
            color: ColorUtil.mediumGrey,
            height: 90.sp,
            strokeWidth: 2.0,
            dottedLength: 15.sp,
            space: 2.0,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CircleAvatar(
                radius: 25.sp,
                backgroundColor: ColorUtil.errorColor,
              ),
            ),
            Expanded(
              child: Text(
                endDate.toLongUserString(),
                style: AppUtil.textStyle(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
