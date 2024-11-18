import 'package:eod_reconcilaton/utils/assets.dart';
import 'package:eod_reconcilaton/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget dashboardCard(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    clipBehavior: Clip.none,
    children: [
      Container(
        height: 140.h,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(12.w)),

        ),
        // color: ,
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align rows across the parent
          crossAxisAlignment: CrossAxisAlignment.center, // Center children vertically
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center, // Center children vertically within this Row
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    titleText(
                      "Bliss",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      bottomPadding: 4,
                    ),
                    titleText(
                      "0012345678",
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Column(
                  children: [
                    SizedBox(height: 8.h,),
                     Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 28.w,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: 25.w,

                ),
              ],
            ),
          ],
        ),
      ),
      Positioned(
        top: 70,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.83,
          // Constrain width
          height: 100,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                // Shadow color with transparency
                spreadRadius: 2,
                // Spread radius
                blurRadius: 4,
                // Blur radius
                offset: Offset(0, 2), // Changes position of shadow (x, y)
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText(
                "Cumulative Profit",
                textAlign: TextAlign.center,
               fontSize: 14.sp,
                bottomPadding: 6.h
                // fontWeight: FontWeight.w400
              ),
              titleText(
                  "N60,000",
                  textAlign: TextAlign.center,
                  fontSize: 14.sp,
                  bottomPadding: 6.h
                // fontWeight: FontWeight.w400
              ),
            ],
          ),
        ),
      )
    ],
  );
}
