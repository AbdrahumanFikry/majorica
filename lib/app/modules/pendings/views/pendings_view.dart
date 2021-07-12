import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:majorica/app/components/animated_list_handler.dart';
import 'package:majorica/app/components/app_builder.dart';
import 'package:majorica/app/components/global_app_bar.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/modules/pendings/components/cobon.dart';
import 'package:majorica/app/modules/pendings/components/pending_list.dart';
import 'package:majorica/app/modules/pendings/components/summary.dart';
import 'package:majorica/generated/l10n.dart';

import '../controllers/pendings_controller.dart';

class PendingsView extends GetView<PendingsController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AppBuilder.of(context)!.rebuild();
        return true;
      },
      child: GlobalScaffold(
        appBar: GlobalAppBar(
          title: S.of(context).pending,
          enableBack: true,
          onCancel: () => AppBuilder.of(context)!.rebuild(),
        ),
        body: AnimatedListHandler(
          children: [
            PendingList(),
            Coupon(),
            Summary(),
          ],
        ),
      ),
    );
  }
}
