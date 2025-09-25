import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget customText(String msg,
    {required TextStyle style,
    TextAlign textAlign = TextAlign.justify,
    overflow = TextOverflow.clip,
    required BuildContext context}) {
  if (msg == null) {
    return SizedBox(
      height: 0,
      width: 0,
    );
  } else {
    if (context != null && style != null) {
      var fontSize = style.fontSize ?? Theme.of(context).textTheme.bodyLarge;
      // style = style.copyWith(
      //     //fontSize: fontSize! - (fullWidth(context) <= 375 ? 2 : 0));
    }
    return Text(
      msg,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}

// Removed faulty extension that interferes with subtraction operator

double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getDimention(context, double unit) {
  if (fullWidth(context) <= 360.0) {
    return unit / 1.3;
  } else {
    return unit;
  }
}

Image customImage(String path, {BoxFit fit = BoxFit.contain}) {
  return Image(
    image: customAdvanceNetworkImage(path),
    fit: fit,
    errorBuilder:
        (BuildContext context, Object exception, StackTrace? stackTrace) {
      return const SizedBox.shrink();
    },
  );
}

dynamic customAdvanceNetworkImage(String path) {
  return CachedNetworkImageProvider(path);
}

double getFontSize(BuildContext context, double size) {
  if (MediaQuery.of(context).textScaleFactor < 1) {
    return getDimention(context, size);
  } else {
    return getDimention(context, size / MediaQuery.of(context).textScaleFactor);
  }
}

String getTypeImage(String type) {
  switch (type) {
    case 'Fighting':
      return 'assets/images/types/Fight.png';
    default:
      return 'assets/images/types/$type.png';
  }
}
