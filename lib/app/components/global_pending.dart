import 'package:flutter/material.dart';
import 'package:majorica/app/components/app_builder.dart';
import 'package:majorica/app/components/badge.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/modules/pendings/controllers/pendings_controller.dart';
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'global_card.dart';

class GlobalPending extends StatelessWidget {
  final Widget child;

  const GlobalPending({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Obx(
        () => Stack(
          children: [
            child,
            if (PendingsController.to.pendingList.isNotEmpty &&
                PendingsController.to.showPendingIcon.value)
              Positioned(
                top: 150.sp,
                right: AppUtil.isLtr ? 0.0 : null,
                left: !AppUtil.isLtr ? 0.0 : null,
                child: GlobalCard(
                  color: Colors.white,
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Badge(
                    top: 0.0,
                    title: PendingsController.to.pendingList.length.toString(),
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.PENDINGS);
                        PendingsController.to.showPendingIcon(false);
                      },
                      icon: const Icon(
                        Icons.bookmark,
                        color: ColorUtil.primaryColor,
                        size: 22.0,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
