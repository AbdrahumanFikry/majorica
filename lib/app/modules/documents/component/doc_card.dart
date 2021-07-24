import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/components/net_image.dart';
import 'package:majorica/app/components/waiting.dart';
import 'package:majorica/app/data/models/document.dart';
import 'package:majorica/app/modules/documents/controllers/documents_controller.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/generated/l10n.dart';

class DocCard extends StatelessWidget {
  final Document document;

  const DocCard({
    required this.document,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Waiting(
        margin: EdgeInsets.zero,
        borderRadius: AppUtil.borderRadius10,
        loading: DocumentsController.to.busyId.value == document.iD,
        child: GlobalCard(
          borderRadius: AppUtil.borderRadius10,
          color: ColorUtil.lightGrey,
          elevation: 5.0,
          margin: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: AppUtil.borderRadius10,
                child: NetImage(
                  'https://backend.majoricahotel.com/clientUploads/${document.filename}',
                  height: 400.sp,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10.0,
                left: 10.0,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black54,
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      final result = await AppUtil.showAlertDialog(
                        title: S.of(context).areYouSure,
                        contentText: S.of(context).removeDoc,
                      );
                      if (result == true) {
                        await DocumentsController.to.removeDoc(document.iD);
                      }
                    },
                    child: const Icon(
                      CupertinoIcons.multiply,
                      color: ColorUtil.whiteColor,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
