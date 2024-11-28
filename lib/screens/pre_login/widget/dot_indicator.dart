import 'package:eod_reconcilaton/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotIndicator extends StatefulWidget {
  final bool isActive;

  const DotIndicator({super.key, required this.isActive});
  @override
  DotIndicatorState createState() => DotIndicatorState();
}

class DotIndicatorState extends State<DotIndicator> {
  @override
  Widget build(BuildContext context) {
    return widget.isActive
        ? AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: 9.h,
        width: 9.w,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            border: Border.all(color: Colors.white, width: 1.w),
            borderRadius: const BorderRadius.all(Radius.circular(100.0))))
        : AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: 9.h,
        width: 9.w,
        decoration: const BoxDecoration(
            color: Color(0xFFC4C4C4),
            borderRadius: BorderRadius.all(Radius.circular(100.0))));
  }
}
