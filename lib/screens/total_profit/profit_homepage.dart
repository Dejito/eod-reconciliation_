import 'package:eod_reconcilaton/screens/dashboard/dashboard_widgets.dart';
import 'package:eod_reconcilaton/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfitHomepage extends StatelessWidget {

  const ProfitHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(16.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              transactionTypeButton(
                title: "POS Profit",
                isProfitScreen: true,
                onTap: () {},
              ),
              transactionTypeButton(
                title: "Transfer Withdrawal Profit",
                isProfitScreen: true,
                onTap: () {},
              ),
              transactionTypeButton(
                title: "POS Profit",
                isProfitScreen: true,
                onTap: () {},
              ),
              transactionTypeButton(
                title: "Total Profit",
                isProfitScreen: true,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
