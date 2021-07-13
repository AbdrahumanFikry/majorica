import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/net_image.dart';
import 'package:majorica/app/modules/room_details/controllers/room_details_controller.dart';

class ImagesSlider extends GetView<RoomDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            height: Get.height * 0.65,
            viewportFraction: 1.0,
            autoPlayCurve: Curves.easeIn,
            onPageChanged: (index, reason) => controller.currentAdIndex(index),
          ),
          items: controller.imgList
              .map(
                (item) => NetImage(
                  item,
                  fit: BoxFit.cover,
                  width: Get.width,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
