import 'package:eod_reconcilaton/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/assets.dart';

class ProfilePage extends StatelessWidget {
  static const id = "profile_page";

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // elevation: 1,
        title: titleText('Profile Set-up', fontSize: 16),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Container(
            color: Colors.grey,
            height: 2,
          ),
        ),

      ),
      body: Container(
        margin: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
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
                "08123456789",
                bottomPadding: 6,
                color: const Color(0XFF9A8498),
              ),
              SizedBox(
                height: 15.h,
              ),

              titleText(" Business Name",bottomPadding: 8.h),
              const TextField(
                obscureText: true,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  // hintText: "",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),
              titleText(" Business Type",bottomPadding: 8.h, topPadding: 16.h),
              const TextField(
                obscureText: true,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  // hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),
          
              titleText(" Role in Business",bottomPadding: 8.h, topPadding: 16.h),
              const TextField(
                obscureText: true,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  // hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
