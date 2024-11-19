import 'package:eod_reconcilaton/screens/tab_screen.dart';
import 'package:eod_reconcilaton/utils/assets.dart';
import 'package:eod_reconcilaton/utils/widgets.dart';
import 'package:eod_reconcilaton/widgets/loading_indicator.dart';
import 'package:eod_reconcilaton/widgets/widgets.dart';
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
              // fontWeight: FontWeight.bold,
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
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const TextField(
                obscureText: true,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Enter your pin",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),

              // Spacer(),

              const SizedBox(height: 100),

              buildElevatedButton(
                  onPressed: () async {
                    showLoadingIndicator();
                    // await Future.delayed(const Duration(seconds: 2));
                    dismissLoadingIndicator();
                    if (context.mounted) {
                      Navigator.of(context)
                          .pushReplacementNamed(TabScreen.id);
                    }
                  },
                  label: "Login",
                  buttonColor: AppColors.primaryColor,
                  textColor: Colors.white,
                  borderColor: Colors.transparent),
              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
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
