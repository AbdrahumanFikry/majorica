import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/app/components/net_image.dart';
import 'package:majorica/app/modules/pendings/controllers/pendings_controller.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:majorica/generated/l10n.dart';
import 'package:majorica/app/components/extensions.dart';

class PendingList extends GetView<PendingsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: controller.pendingList
              .map(
                (pending) => GlobalCard(
                  elevation: 0.0,
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: AppUtil.borderRadius10,
                        child: pending.image == null
                            ? Image.asset(
                                PathUtil.appIcon,
                                height: 300.sp,
                                width: 270.sp,
                                fit: BoxFit.contain,
                              )
                            : NetImage(
                                pending.image!,
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
                                    pending.name!,
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
                                    onTap: () async {
                                      final result =
                                          await AppUtil.showAlertDialog(
                                        enableCancel: true,
                                        title: S.of(context).areYouSure,
                                        contentText:
                                            S.of(context).deleteThisReservation,
                                      );
                                      if (result == true) {
                                        controller.pendingList.remove(pending);
                                        if (controller.pendingList.isEmpty) {
                                          Get.back();
                                        }
                                      }
                                    },
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
                              '${pending.startDate!.toDayMonthOnly()} : ${pending.endDate!.toDayMonthOnly()}',
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
                              '${pending.sleeps ?? '1'} ${S.of(context).participants}',
                              style: AppUtil.textStyle(
                                color: ColorUtil.darkBlue,
                                fontWeight: FontWeight.w500,
                                fontSize: 40.sp,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            ...[
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${S.of(context).packages} : ',
                                    style: AppUtil.textStyle(
                                      color: ColorUtil.darkBlue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 40.sp,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      pending.roomPackage?.price == null ||
                                              pending.roomPackage?.price == 0
                                          ? pending.roomPackage!.name!
                                          : '${pending.roomPackage!.name} (${pending.sleeps ?? '0'}*${pending.roomPackage?.price ?? '0'} ${S.of(context).egp})',
                                      style: AppUtil.textStyle(
                                        color: ColorUtil.errorColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 40.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            if (pending.reserveInfo?.offer == true &&
                                pending.reserveInfo?.nightsTotal != null) ...[
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${S.of(context).totalBeforeCoupon} : ',
                                    style: AppUtil.textStyle(
                                      color: ColorUtil.darkBlue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 40.sp,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${pending.reserveInfo!.nightsTotal} ${S.of(context).egp}',
                                      style: AppUtil.textStyle(
                                        color: ColorUtil.errorColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 40.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            if (pending.reserveInfo?.offer == true &&
                                pending.reserveInfo?.offerName != null) ...[
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${S.of(context).offer} : ',
                                    style: AppUtil.textStyle(
                                      color: ColorUtil.darkBlue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 40.sp,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      pending.reserveInfo?.offerName ?? '',
                                      style: AppUtil.textStyle(
                                        color: ColorUtil.errorColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 40.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
                                  '${pending.reserveInfo == null ? pending.total : pending.reserveInfo!.nightsFinalPrice} ${S.of(context).egp}',
                                  style: AppUtil.textStyle(
                                    color: ColorUtil.errorColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 40.sp,
                                  ),
                                ),
                                if (pending.reserveInfo?.packagePrice != null &&
                                    pending.reserveInfo?.packagePrice != 0)
                                  Text(
                                    ' + ${pending.reserveInfo?.packagePrice ?? '0'} ${S.of(context).egp} ',
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
              )
              .toList(),
        ),
      ),
    );
  }
}
