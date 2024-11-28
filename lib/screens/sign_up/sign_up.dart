import 'package:eod_reconcilaton/screens/login_screen.dart';
import 'package:eod_reconcilaton/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/assets.dart';
import '../../utils/widgets.dart';
import '../../widgets/loading_indicator.dart';

class SignUpScreen extends StatelessWidget {
  static const id = "sign_up_screen";
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sign up",
            style: GoogleFonts.mitr(
              fontSize: 25.sp,
              color: AppColors.primaryColor,
            ),
          ),

          const SizedBox(
            height: 38,
          ),
          const TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "Full name",
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
          ),
          SizedBox(height: 30.h),
          const TextField(
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
          ),
          SizedBox(height: 30.h),
          const TextField(
            obscureText: false,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Phone",
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
          ),
          SizedBox(height: 30.h),
          const TextField(
            obscureText: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Set Password",
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
          ),
          SizedBox(height: 30.h),
          const TextField(
            obscureText: true,
            keyboardType: TextInputType.numberWithOptions(decimal: false),
            decoration: InputDecoration(
              hintText: "Confirm Password",
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
          ),

          // Spacer(),

          const SizedBox(height: 30),

          InkWell(
            onTap: () async {
              showLoadingIndicator();
              await Future.delayed(const Duration(seconds: 2));
              dismissLoadingIndicator();
              showToast(message: "Congratulation! \nAccount creation successful.");
              if (context.mounted) {
                Navigator.of(context).pushReplacementNamed(LoginScreen.id);
              }
            },
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              height: 55.h,
              width: double.infinity,
              child: Center(
                child: titleText("Sign up",
                    color: Colors.white,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp),
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "Do you already have an account?",
                style: GoogleFonts.mitr(
                  fontSize: 13.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(LoginScreen.id);
                  },
                  child: Text(
                    "Sign in",
                    style: GoogleFonts.mitr(
                      fontSize: 13.sp,
                      color: Colors.redAccent,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
