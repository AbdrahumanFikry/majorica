import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:majorica/app/components/animated_list_handler.dart';
import 'package:majorica/app/components/global_app_bar.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/modules/reservations/components/resrvation_card.dart';
import 'package:majorica/app/modules/reservations/components/tab_item.dart';
import 'package:majorica/generated/l10n.dart';
import '../controllers/reservations_controller.dart';

class ReservationsView extends GetView<ReservationsController> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      appBar: GlobalAppBar(
        title: S.of(context).allReservations,
      ),
      body: Obx(
        () => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabItem(
                  title: S.of(context).past,
                  selected: controller.reservationType.value == 'Past',
                  onTap: () => controller.reservationType('Past'),
                ),
                TabItem(
                  title: S.of(context).upComing,
                  selected: controller.reservationType.value == 'UpComing',
                  onTap: () => controller.reservationType('UpComing'),
                ),
              ],
            ),
            Expanded(
              child: AnimatedListHandler(
                children: List.generate(
                  2,
                  (index) => const ReservationCard(
                    title: 'Double Room',
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
