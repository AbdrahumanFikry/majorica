import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/app_button.dart';

import 'package:majorica/app/components/global_app_bar.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/modules/documents/component/image_handler.dart';
import 'package:majorica/app/modules/documents/controllers/documents_controller.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/generated/l10n.dart';

class AddDocumentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      appBar: GlobalAppBar(
        title: S.of(context).addDocument,
        enableBack: true,
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.3,
                width: Get.width,
                child: ImageHandler(
                  title: '',
                  image: DocumentsController.to.docFile.value,
                  addFunction: () async {
                    final file = (await AppUtil.pickFiles(
                      allowCompression: false,
                    ))
                        .first;
                    if (file.path.isNotEmpty) {
                      DocumentsController.to.docFile(file);
                    }
                  },
                  removeFunction: () =>
                      DocumentsController.to.docFile(File('path')),
                ),
              ),
              AppButton(
                title: S.of(context).done,
                isBusy: DocumentsController.to.busyId.value == 'new',
                margin: const EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                onTap: DocumentsController.to.uploadDoc,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
