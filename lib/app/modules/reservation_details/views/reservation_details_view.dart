import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/global_app_bar.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/modules/reservation_details/components/details_block.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/generated/l10n.dart';

import '../controllers/reservation_details_controller.dart';

class ReservationDetailsView extends GetView<ReservationDetailsController> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      appBar: GlobalAppBar(
        title: S.of(context).reservationDetails,
        enableBack: true,
        backgroundColor: ColorUtil.primaryColor,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
          ),
          Obx(
            () {
              final res = controller.reservationDetails.value;
              return Positioned(
                top: 0.0,
                right: 0.0,
                left: 0.0,
                child: Container(
                  height: 300.sp,
                  width: Get.width,
                  color: ColorUtil.primaryColor,
                  child: Column(
                    children: [
                      Text(
                        res!.checkOut!.isBefore(DateTime.now())
                            ? S.of(context).past
                            : S.of(context).upComing,
                        style: AppUtil.textStyle(
                          color: ColorUtil.whiteColor,
                          fontSize: 55.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        res.statusText!,
                        style: AppUtil.textStyle(
                          color: res.statusColor != null
                              ? AppUtil.fromHex(res.statusColor!)
                              : ColorUtil.whiteColor,
                          fontSize: 55.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          DetailsBlock(),
        ],
      ),
    );
  }
}
