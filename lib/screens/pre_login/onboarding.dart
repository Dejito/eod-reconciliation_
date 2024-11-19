import 'package:eod_reconcilaton/screens/login_screen.dart';
import 'package:eod_reconcilaton/screens/pre_login/widget/dot_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {

  static const id = 'onboarding';

  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late int totalPages = OnBoardingItems.loadOnboardItem().length;
  //Page view controller to controller onboarding slide
  PageController controller = PageController();
  //Initial start of page view
  int _currentIndex = 0;

//Animation opacity
  double opacity = 1.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: controller,
                itemCount: totalPages,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  OnBoardingItem item =
                  OnBoardingItems.loadOnboardItem()[index];
                  return Stack(
                    children: [
                      Image.asset(
                        item.image,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                      ),
                      Positioned(
                          left: 20.w,
                          top: 493.h,
                          right: 20.w,
                          child: Center(
                            child: Text(item.title!,
                                style: GoogleFonts.roboto(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                                textAlign: TextAlign.center),
                          )),
                    ],
                  );
                }),
          ),
          Positioned(
            left: 20.w,
            right: 20.w,
            bottom: 60.h,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: OnBoardingItems.loadOnboardItem()
                        .asMap()
                        .entries
                        .map((entry) {
                      var key = entry.key;
                      return Padding(
                          padding: EdgeInsets.only(right: 12.0.w, bottom: 71.h),
                          child: DotIndicator(
                              isActive: _currentIndex == key ? true : false));
                    }).toList()),
                // IAmAliveButton(
                //   height: 52.h,
                //   width: 320.w,
                //   text: _currentIndex != totalPages - 1
                //       ? S.of(context).next
                //       : S.of(context).getStarted,
                //   fontSize: 16.sp,
                //   onPressed: () => goOnboardingWidget(),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void goOnboardingWidget() {
    // LocalStorageUtils.write(AppConstants.isUserFirstTime, 'true');
    if (_currentIndex < totalPages - 1) {
      _currentIndex++;
      controller.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacementNamed(context, LoginScreen.id);
      // getIt<NavigationService>()
      //     .pushReplace(routeName: VerificationRoutes.verificationRoot);
    }
  }
}
