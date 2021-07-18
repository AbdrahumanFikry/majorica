import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:majorica/app/utilities/path_util.dart';

import 'loading.dart';

class NetImage extends CachedNetworkImage {
  NetImage(
    String src, {
    double? height,
    double? width,
    BoxFit? fit,
  }) : super(
          imageUrl: src.contains('https') ? src : imagesAPI + src,
          width: width,
          height: height,
          fit: fit ?? BoxFit.cover,
          placeholder: (context, url) => Loading(),
          errorWidget: (context, url, error) => Image.asset(
            PathUtil.appIcon,
            width: width,
            height: height,
            fit: BoxFit.contain,
          ),
        );
}
