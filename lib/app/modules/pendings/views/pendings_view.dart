import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/animated_list_handler.dart';
import 'package:majorica/app/components/app_button.dart';
import 'package:majorica/app/components/app_text_field.dart';
import 'package:majorica/app/components/global_app_bar.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/components/waiting.dart';
import 'package:majorica/app/modules/pendings/components/cobon.dart';
import 'package:majorica/app/modules/pendings/components/pending_list.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/generated/l10n.dart';

import '../controllers/pendings_controller.dart';

class PendingsView extends GetView<PendingsController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.pendingList.isNotEmpty) {
          controller.showPendingIcon(true);
        } else {
          controller.showPendingIcon(false);
        }
        return true;
      },
      child: GlobalScaffold(
        appBar: GlobalAppBar(
          title: S.of(context).pending,
          enableBack: true,
          onCancel: () {
            if (controller.pendingList.isNotEmpty) {
              controller.showPendingIcon(true);
            } else {
              controller.showPendingIcon(false);
            }
          },
        ),
        body: Obx(
          () => AnimatedListHandler(
            children: [
              PendingList(),
              Coupon(),
              GlobalCard(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              S.of(context).total,
                              style: AppUtil.textStyle(
                                fontSize: 50.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorUtil.darkBlue,
                              ),
                            ),
                          ),
                          Text(
                            '${controller.allTotal.toStringAsFixed(0)} ${S.of(context).egp}',
                            style: AppUtil.textStyle(
                              fontSize: 50.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorUtil.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      if (int.tryParse(controller.outStandingBalance.value)! >
                          0)
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                S.of(context).outStandingBalance,
                                style: AppUtil.textStyle(
                                  fontSize: 50.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ColorUtil.darkBlue,
                                ),
                              ),
                            ),
                            Text(
                              '${controller.outStandingBalance.value} ${S.of(context).egp}',
                              style: AppUtil.textStyle(
                                fontSize: 50.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorUtil.primaryColor,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).depositedAmount,
                      style: AppUtil.textStyle(
                        fontSize: 50.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorUtil.darkBlue,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Waiting(
                      loading: controller.busyId.value == 'addPending',
                      child: AppTextField(
                        controller.payAmount,
                        underLine: false,
                        readOnly: controller.isBusy.value,
                        hintText: S.of(context).amount,
                        hintColor: ColorUtil.mediumGrey,
                        keyBoardType: TextInputType.number,
                        suffixWidget: Text(
                          S.of(context).egp,
                          style: AppUtil.textStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorUtil.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppButton(
                elevation: 2.0,
                isBusy: controller.isBusy.value,
                onTap: controller.confirmReservation,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                title: S.of(context).confirmReservation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
