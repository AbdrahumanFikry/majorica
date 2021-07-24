import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/animated_list_handler.dart';
import 'package:majorica/app/components/app_button.dart';
import 'package:majorica/app/components/app_text_field.dart';
import 'package:majorica/app/components/global_app_bar.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/modules/pendings/components/cobon.dart';
import 'package:majorica/app/modules/pendings/components/pending_list.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/generated/l10n.dart';

import '../controllers/pendings_controller.dart';

class PendingsView extends GetView<PendingsController> {
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
                    AppTextField(
                      controller.payAmount,
                      underLine: false,
                      readOnly: controller.couponApplied.value,
                      hintText: S.of(context).enterDiscountCoupon,
                      hintColor: ColorUtil.mediumGrey,
                      suffixWidget: Text(
                        S.of(context).egp,
                        style: AppUtil.textStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorUtil.primaryColor,
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
