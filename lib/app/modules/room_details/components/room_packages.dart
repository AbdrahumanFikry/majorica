import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/data/models/room_package.dart';
import 'package:majorica/app/modules/room_details/controllers/room_details_controller.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/generated/l10n.dart';

class RoomPackages extends GetView<RoomDetailsController> {
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
        child: Obx(
          () => Column(
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
              ...controller.roomPackagesFromCache
                  .map(
                    (package) => Row(
                      children: [
                        Radio<RoomPackage>(
                          value: package,
                          groupValue: controller.selectedPackage.value,
                          activeColor: ColorUtil.primaryColor,
                          onChanged: (val) {
                            controller.selectedPackage(val);
                          },
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: Text(
                            package.name ?? '-',
                            style: AppUtil.textStyle(
                              fontSize: 48.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            softWrap: true,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        if (package.price != null && package.price != 0)
                          Text(
                            '(${controller.sleeps.value} * ${package.price}) ${S.of(context).egpPerNight}',
                            style: AppUtil.textStyle(
                              fontSize: 40.sp,
                              color: ColorUtil.errorColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ],
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
