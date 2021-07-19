import 'package:flutter/material.dart';
import 'package:majorica/app/components/badge.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/modules/pendings/controllers/pendings_controller.dart';
import 'package:majorica/app/routes/app_pages.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
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
                top: 55.0,
                right: AppUtil.isLtr ? 55.0 : null,
                left: !AppUtil.isLtr ? 55.0 : null,
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
