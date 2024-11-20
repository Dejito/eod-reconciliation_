import 'package:eod_reconcilaton/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  static const id = "profile_page";

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // elevation: 1,
        title: titleText('Profile Set-up', fontSize: 18),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5.0),
          child: Container(
            color: Colors.grey,
            height: 2,
          ),
        ),
        // actions: [
        //   InkWell(
        //     child: Container(
        //       decoration: BoxDecoration(
        //           border: Border.all(color: const Color(0xFF1E1E1E)),
        //           borderRadius: const BorderRadius.all(Radius.circular(100))),
        //       child: const Icon(Icons.person),
        //     ),
        //   ),
        //   const SizedBox(
        //     width: 12,
        //   )
        // ],
      ),
      body: Container(
        margin: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: titleText("Kindly complete the profile set-up",
                  bottomPadding: 12.h, textAlign: TextAlign.center),
            ),
            Center(
              child: Image.asset(
                "assets/images/gg_profile.png",
                width: 80,
                height: 80,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            titleText("Full name"),
            titleText(
              "Mishak Motunrayo",
              bottomPadding: 6,
              color: const Color(0XFF9A8498),
            ),
            titleText("Email Address"),
            titleText(
              "Mishakmotunrayo@gmail.com",
              bottomPadding: 6,
              color: const Color(0XFF9A8498),
            ),
            titleText("Phone"),
            titleText(
              "0812345678",
              bottomPadding: 6,
              color: const Color(0XFF9A8498),
            ),
          ],
        ),
      ),
    );
  }
}
