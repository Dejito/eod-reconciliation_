import 'package:eod_reconcilaton/screens/sign_up/sign_up.dart';
import 'package:eod_reconcilaton/screens/tab_screen.dart';
import 'package:eod_reconcilaton/utils/assets.dart';
import 'package:eod_reconcilaton/utils/widgets.dart';
import 'package:eod_reconcilaton/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  static const id = 'landing_page';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('EOD Reconciliation'
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset(
              //   'assets/images/landing_page.png',
              //   fit: BoxFit.fill,
              // ),
              // titleText(
              //   "EOD Reconciliation",
              //   fontSize: 25.sp,
              // ),
              Text(
                "Login to continue",
                style: GoogleFonts.mitr(
                  fontSize: 25.sp,
                  color: AppColors.primaryColor,
                ),
              ),

              const SizedBox(
                height: 68,
              ),
              const TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Phone number",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),
              SizedBox(height: 50.h),
              const TextField(
                obscureText: true,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),

              // Spacer(),

              const SizedBox(height: 50),

              InkWell(
                onTap: () async {
                  showLoadingIndicator();
                  // await Future.delayed(const Duration(seconds: 2));
                  dismissLoadingIndicator();
                  if (context.mounted) {
                    Navigator.of(context).pushReplacementNamed(TabScreen.id);
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
                    child: titleText("Log in",
                        color: Colors.white, textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold, fontSize: 15.sp),
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
                    "Don't have an account?",
                    style: GoogleFonts.mitr(
                      fontSize: 13.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpScreen.id);
                      },
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.mitr(
                          fontSize: 13.sp,
                          color: Colors.redAccent,
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget forgotPassword() {
  return Container(
    margin: const EdgeInsets.only(top: 15),
    width: 260,
    height: 44,
    child: GestureDetector(
      onTap: () {},
      child: const Text(
        "Forgot Password",
        style: TextStyle(
            decoration: TextDecoration.underline, decorationColor: Colors.blue),
      ),
    ),
  );
}
