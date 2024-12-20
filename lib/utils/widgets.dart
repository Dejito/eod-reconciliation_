import 'package:eod_reconcilaton/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget titleText(
    String text,
    { Color color = AppColors.textColor,
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
      left: endPadding.w,
    ),
    child: Text(
      text,
      style: GoogleFonts.mitr(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
      ),
      // selectionColor: color,
      textAlign: textAlign,
    ),
  );
}


Widget buildAppBar({
  required String title,
  required String transactionsCount,
}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(5.0), // Define the preferred size
      child: Container(
        color: Colors.grey,
        height: 2,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Center(
          child: Text(
            transactionsCount,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    ],
  );
}
