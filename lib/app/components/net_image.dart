import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/app/utilities/path_util.dart';
import 'package:majorica/generated/l10n.dart';

import 'loading.dart';

class NetImage extends CachedNetworkImage {
  NetImage(
    String src, {
    double? height,
    double? width,
    BoxFit? fit,
  }) : super(
          imageUrl: imagesAPI + src,
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
