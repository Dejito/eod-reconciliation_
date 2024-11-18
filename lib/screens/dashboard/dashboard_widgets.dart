import 'package:eod_reconcilaton/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';





Widget dashboardCard(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    clipBehavior: Clip.none,
    children: [
      Container(
        height: 100.h,
        width: double.infinity,
        padding: EdgeInsets.all(12),
        color: AppColors.primaryColor,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text properly
                  children: [
                    Text("Bliss"),
                    Text("0012345678")
                  ],
                ),
                SizedBox(width: 6),
                Icon(Icons.chevron_right),
              ],
            ),
            Icon(Icons.notifications_none),
          ],
        ),
      ),
      Positioned(
        top: 60,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.86, // Constrain width
          height: 100,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8), // Shadow color with transparency
                spreadRadius: 2, // Spread radius
                blurRadius: 4, // Blur radius
                offset: Offset(0, 2), // Changes position of shadow (x, y)
              ),
            ],
          ),

          child: Text(
            "Cumu profit",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    ],
  );
}
