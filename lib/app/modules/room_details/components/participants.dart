import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/components/quantity_widget.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/generated/l10n.dart';

class RoomParticipants extends StatelessWidget {
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
            Row(
              children: [
                Expanded(
                  child: Text(
                    S.of(context).participants,
                    style: AppUtil.textStyle(
                      fontSize: 60.sp,
                      color: ColorUtil.darkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
                const QuantityWidget(
                  amount: 1,
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              '${S.of(context).maxParticipantsNum} (2)',
              style: AppUtil.textStyle(
                fontSize: 42.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
