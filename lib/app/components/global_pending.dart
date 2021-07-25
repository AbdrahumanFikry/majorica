import 'package:flutter/material.dart';
import 'package:majorica/app/components/badge.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/modules/pendings/controllers/pendings_controller.dart';
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:get/get.dart';
import 'global_scaffold.dart';

class GlobalPending extends StatelessWidget {
  final Widget? child;

  const GlobalPending({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
          ),
          if (child != null)
            Positioned(
              top: 0.0,
              bottom: 0.0,
              right: 0.0,
              left: 0.0,
              child: child ?? const SizedBox(),
            ),
          Obx(
            () {
              if (Get.isRegistered<PendingsController>() &&
                  PendingsController.to.pendingList.isNotEmpty &&
                  PendingsController.to.showPendingIcon.value) {
                return Positioned(
                  top: 5.0,
                  right: AppUtil.isLtr ? 0.0 : null,
                  left: !AppUtil.isLtr ? 0.0 : null,
                  child: SafeArea(
                    child: GlobalCard(
                      color: ColorUtil.whiteColor,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      borderRadius: BorderRadius.circular(100),
                      child: Badge(
                        top: 0.0,
                        title:
                            PendingsController.to.pendingList.length.toString(),
                        child: IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.PENDINGS);
                            PendingsController.to.showPendingIcon(false);
                          },
                          icon: const Icon(
                            Icons.bookmark,
                            color: ColorUtil.darkBlue,
                            size: 34.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
