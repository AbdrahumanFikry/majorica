import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/app/components/net_image.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/generated/l10n.dart';

class PendingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            2,
            (index) => GlobalCard(
              elevation: 0.0,
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: AppUtil.borderRadius10,
                    child: NetImage(
                      'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_450,q_auto,w_450/itemimages/96/95/96959_v6.jpeg',
                      height: 300.sp,
                      width: 270.sp,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Double Room',
                                style: AppUtil.textStyle(
                                  color: ColorUtil.darkBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.sp,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 3.0,
                              ),
                              child: GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  CupertinoIcons.multiply,
                                  color: ColorUtil.errorColor,
                                  size: 75.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '2 ${S.of(context).participants}',
                          style: AppUtil.textStyle(
                            color: ColorUtil.darkBlue,
                            fontWeight: FontWeight.w500,
                            fontSize: 40.sp,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '25 july : 30 July',
                          style: AppUtil.textStyle(
                            color: ColorUtil.darkBlue,
                            fontWeight: FontWeight.w500,
                            fontSize: 40.sp,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Text(
                              '${S.of(context).total} : ',
                              style: AppUtil.textStyle(
                                color: ColorUtil.darkBlue,
                                fontWeight: FontWeight.w500,
                                fontSize: 40.sp,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '1800${S.of(context).egp}',
                              style: AppUtil.textStyle(
                                color: ColorUtil.errorColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 40.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
