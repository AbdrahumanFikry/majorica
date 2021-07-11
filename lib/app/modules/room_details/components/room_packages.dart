import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/generated/l10n.dart';

class RoomPackages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalCard(
      color: ColorUtil.whiteColor,
      elevation: 10.0,
      borderRadius: AppUtil.borderRadius25,
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 30.0,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 15.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).packages,
              style: AppUtil.textStyle(
                fontSize: 60.sp,
                color: ColorUtil.darkBlue,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: true,
            ),
            const SizedBox(
              height: 15.0,
            ),
            ...List.generate(
              3,
              (index) => Row(
                children: [
                  const Radio(
                    value: 0,
                    groupValue: 0,
                    activeColor: ColorUtil.primaryColor,
                    onChanged: null,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Text(
                      'Bed only',
                      style: AppUtil.textStyle(
                        fontSize: 48.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                    ),
                  ),
                  Text(
                    '(1 * 50.0) ${S.of(context).egpPerNight}',
                    style: AppUtil.textStyle(
                      fontSize: 40.sp,
                      color: ColorUtil.errorColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
