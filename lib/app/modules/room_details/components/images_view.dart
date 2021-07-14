import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/net_image.dart';
import 'package:majorica/app/modules/room_details/controllers/room_details_controller.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagesSlider extends GetView<RoomDetailsController> {
  final List<String?>? images;

  const ImagesSlider({
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return images == null || images!.isEmpty
        ? SizedBox(
            height: Get.height * 0.65,
            width: Get.width,
            child: Center(
              child: Image.asset(
                PathUtil.appIcon,
                fit: BoxFit.cover,
                height: 400.sp,
                width: 400.sp,
              ),
            ),
          )
        : CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              height: Get.height * 0.65,
              viewportFraction: 1.0,
              autoPlayCurve: Curves.easeIn,
              onPageChanged: (index, reason) =>
                  controller.currentAdIndex(index),
            ),
            items: images!
                .map(
                  (item) => NetImage(
                    item!,
                    fit: BoxFit.cover,
                    width: Get.width,
                  ),
                )
                .toList(),
          );
  }
}
