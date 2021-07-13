import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/global_card.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/components/loading.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomImagesView extends StatelessWidget {
  final List<String> galleryItems;

  const RoomImagesView({required this.galleryItems});

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Stack(
        children: [
          Container(
            color: ColorUtil.blackColor,
            height: Get.height,
            width: Get.width,
            child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  tightMode: true,
                  imageProvider: CachedNetworkImageProvider(
                    galleryItems[index],
                  ),
                  initialScale: PhotoViewComputedScale.contained,
                  heroAttributes: PhotoViewHeroAttributes(
                    tag: galleryItems[index].split('/').last,
                  ),
                );
              },
              itemCount: galleryItems.length,
              loadingBuilder: (context, event) => Loading(),
            ),
          ),
          Positioned(
            top: 140.sp,
            right: !AppUtil.isLtr ? 0.0 : null,
            left: AppUtil.isLtr ? 0.0 : null,
            child: GlobalCard(
              color: Colors.white,
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: ColorUtil.primaryColor,
                  size: 22.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
