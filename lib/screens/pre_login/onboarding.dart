import 'package:eod_reconcilaton/screens/login_screen.dart';
import 'package:eod_reconcilaton/screens/pre_login/widget/dot_indicator.dart';
import 'package:eod_reconcilaton/utils/assets.dart';
import 'package:eod_reconcilaton/widgets/widgets.dart';
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

  final List subtitleText = [
    ",,,profitability made easy",
    " ...one transaction at a time"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            // Constrain the height of PageView.builder
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: controller,
              itemCount: totalPages,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                OnBoardingItem item = OnBoardingItems.loadOnboardItem()[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Container()),

                    Image.asset(
                      item.image,
                      fit: BoxFit.fill,
                      // width: 400,
                      // height: 400,
                    ),
                    Text(
                      "EOD RECONCILIATION",
                      style: GoogleFonts.oleoScript(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                      // selectionColor: color,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                        subtitleText[index],
                      style: GoogleFonts.alegreya(
                        fontSize: 12,
                        fontWeight: FontWeight.w500
                      ),
                    ),

                    Expanded(child: Container()),
                    // SizedBox(
                    //   height: 30.h,
                    // ),
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: OnBoardingItems.loadOnboardItem()
                            .asMap()
                            .entries
                            .map((entry) {
                          var key = entry.key;
                          return Padding(
                              padding:
                                  EdgeInsets.only(right: 12.0.w, bottom: 20.h),
                              child: DotIndicator(
                                  isActive:
                                      _currentIndex == key ? true : false));
                        }).toList()),

                    buildElevatedButton2(
                      onPressed: () {
                        gotoLoginScreen();
                      },
                      label: "Get Started",
                      enabledButton: index == 1
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    )
        );
  }

  void gotoLoginScreen() {
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
    }
  }
}
