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
        title: titleText('Dashboard', fontSize: 18),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5.0),
          child: Container(
            color: Colors.grey,
            height: 2,
          ),
        ),
        actions: [
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF1E1E1E)),
                  borderRadius: const BorderRadius.all(Radius.circular(100))),
              child: const Icon(Icons.person),
            ),
          ),
          const SizedBox(
            width: 12,
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16.w),
        child: Column(
          children: [
            titleText("Kindly complete the profile set-up"),
            Icon(Icons.person_pin, size: 50.w,)
          ],
        ),
      ),
    );
  }
}
