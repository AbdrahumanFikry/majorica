import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/animated_list_handler.dart';
import 'package:majorica/app/components/empty_widget.dart';
import 'package:majorica/app/components/global_app_bar.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/components/loading.dart';
import 'package:majorica/app/modules/reservations/views/add_document_view.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/generated/l10n.dart';

import '../component/doc_card.dart';
import '../controllers/documents_controller.dart';

class DocumentsView extends GetView<DocumentsController> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      appBar: GlobalAppBar(
        title: S.of(context).documents,
        enableBack: true,
      ),
      body: Obx(
        () {
          if (controller.isBusy.value) {
            return Loading();
          } else {
            if (controller.allDocs.isEmpty) {
              return const EmptyWidget();
            } else {
              return AnimatedListHandler(
                children: [
                  ...controller.allDocs
                      .map(
                        (document) => DocCard(document: document),
                      )
                      .toList(),
                  const SizedBox(
                    height: 50.0,
                  ),
                ],
              );
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorUtil.primaryColor,
        elevation: 10.0,
        icon: const Icon(
          Icons.add,
          color: ColorUtil.whiteColor,
          size: 18.0,
        ),
        onPressed: () => Get.to(() => AddDocumentView()),
        label: Text(
          S.of(context).addDocument,
          style: const TextStyle(
            color: ColorUtil.whiteColor,
          ),
        ),
      ),
    );
  }
}
