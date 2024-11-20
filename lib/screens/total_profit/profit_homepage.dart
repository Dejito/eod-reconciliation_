import 'package:eod_reconcilaton/screens/dashboard/dashboard_widgets.dart';
import 'package:eod_reconcilaton/screens/total_profit/total_profit.dart';
import 'package:eod_reconcilaton/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../deposits/deposit_increase_screen.dart';
import '../pos_withdrawal/pos_with_increase_screen.dart';
import '../transfer_withdrawal/tx_with_increase_screen.dart';

class ProfitHomepage extends StatelessWidget {

  const ProfitHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: titleText('Profits'),
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
              SizedBox(
                height: 20.h,
              ),
              transactionTypeButton(
                title: "POS Profit",
                isProfitScreen: true,
                onTap: () {
                  Navigator.of(context).pushNamed(PosWithIncreaseScreen.id);
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              transactionTypeButton(
                title: "Transfer Withdrawal Profit",
                isProfitScreen: true,
                onTap: () {
                  Navigator.of(context).pushNamed(TxWithIncreaseScreen.id);
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              transactionTypeButton(
                title: "Deposit Profit",
                isProfitScreen: true,
                onTap: () {
                  Navigator.of(context).pushNamed(DepositIncreaseScreen.id);
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              transactionTypeButton(
                title: "Total Profit",
                isProfitScreen: true,
                onTap: () {
                  Navigator.of(context).pushNamed(TotalProfit.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
