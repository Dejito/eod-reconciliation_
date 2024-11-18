import 'package:eod_reconcilaton/screens/dashboard/dashboard_widgets.dart';
import 'package:eod_reconcilaton/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfitHomepage extends StatelessWidget {

  const ProfitHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profits'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5.0),
          // Define the preferred size
          child: Container(
            color: Colors.grey,
            height: 2,
          ),
        ),
      ),
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
              SizedBox(
                height: 20.h,
              ),
              transactionTypeButton(
                title: "Transfer Withdrawal Profit",
                isProfitScreen: true,
                onTap: () {},
              ),
              SizedBox(
                height: 20.h,
              ),
              transactionTypeButton(
                title: "POS Profit",
                isProfitScreen: true,
                onTap: () {},
              ),
              SizedBox(
                height: 20.h,
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
