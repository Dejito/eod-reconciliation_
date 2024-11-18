

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget titleText(
    {required String text,
      Color color = Colors.black,
      double fontSize = 14,
      double topPadding = 0.0,
      double bottomPadding = 0.0,
      double startPadding = 0.0,
      double endPadding = 0.0,
      FontWeight fontWeight = FontWeight.w400,
      TextAlign textAlign = TextAlign.justify}) {
  return Padding(
    padding: EdgeInsets.only(
        top: topPadding.h,
        bottom: bottomPadding.h,
        right: startPadding.w,
        left: endPadding.w),
    child: Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
      ),
      // selectionColor: color,
      textAlign: textAlign,
    ),
  );
}