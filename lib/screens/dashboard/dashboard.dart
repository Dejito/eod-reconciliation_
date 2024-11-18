import 'package:eod_reconcilaton/screens/dashboard/dashboard_widgets.dart';
import 'package:eod_reconcilaton/screens/pos_withdrawal/pos_withdrawal_screen.dart';
import 'package:eod_reconcilaton/screens/transfer_withdrawal/transfer_withdrawal_screen.dart';
import 'package:eod_reconcilaton/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/main_drawer.dart';
import '../deposits/deposit_screen.dart';

class Dashboard extends StatelessWidget {
  static const id = 'selection_screen';

  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        // elevation: 1,
        title: const Text('Homepage'),
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
      drawer: const MainDrawer(),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              dashboardCard(context),
              const SizedBox(
                height: 80,
              ),
              titleText("Transaction Type"),
              transactionTypeButton(title: "POS Transactions", onTap: (){
                Navigator.of(context).pushNamed(POSWithdrawalScreen.id);
              }),
              SizedBox(height: 20.h,),
              transactionTypeButton(title: "Bank Transfer Withdrawal", onTap: (){
                      Navigator.of(context).pushNamed(TransferWithdrawalScreen.id);
              }),
              SizedBox(height: 20.h,),
              transactionTypeButton(title: "Deposits", onTap: (){
                      Navigator.of(context).pushNamed(DepositScreen.id);

              }),
            ],
          ),
        ),
      ),
    );
  }
}
