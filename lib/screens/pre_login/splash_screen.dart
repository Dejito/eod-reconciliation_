import 'package:eod_reconcilaton/screens/pre_login/onboarding.dart';
import 'package:eod_reconcilaton/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late bool isFirstTime;

  @override
  void initState() {
    // isUserFirstTime().then((value) => isFirstTime = value);
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, OnboardingScreen.id);
        // Navigate to the next screen
        // getIt<NavigationService>().pushReplace(
        //     routeName: isFirstTime
        //         ? RootRoutes.onboardingScreen
        //         : VerificationRoutes.verificationRoot);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Future<bool> isUserFirstTime() async {
  //   // var firstTime = await LocalStorageUtils.read(AppConstants.isUserFirstTime);
  //   // return firstTime == null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppColors.scaffoldBackgroundColor,
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/eod_logo.png',
            // fit: BoxFit.fitHeight,
            height: 300.h,
            width: 300.w,
          ),
        ),
        // SizedBox(
        //   height: 10.h,
        // ),
        Text(
          "POS Buddy",
          style: GoogleFonts.oleoScript(
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
          // selectionColor: color,
          textAlign: TextAlign.center,
        ),
      ],
    ));
  }
}
