import 'package:eod_reconcilaton/screens/dashboard/dashboard_widgets.dart';
import 'package:eod_reconcilaton/screens/dashboard/profile_page.dart';
import 'package:eod_reconcilaton/screens/pos_withdrawal/pos_withdrawal_screen.dart';
import 'package:eod_reconcilaton/screens/transfer_withdrawal/transfer_withdrawal_screen.dart';
import 'package:eod_reconcilaton/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/deposit_brain.dart';
import '../../providers/pos_withdrawal_brain.dart';
import '../../providers/profit_db.dart';
import '../../providers/tf_withdrawal_brain.dart';
import '../../widgets/main_drawer.dart';
import '../deposits/deposit_screen.dart';

class Dashboard extends StatefulWidget {
  static const id = 'dashboard';

  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  bool isCalled = false;
  @override
  void didChangeDependencies() async {
    isCalled = true;
    await Provider.of<ProfitDatabase>(context).fetchAndSetData();
    isCalled = false;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {

     // Provider.of<TransactionBrain>(context, listen: false).fetchAndSetData();
     // Provider.of<PosWithdrawalBrain>(context,listen: false).fetchAndSetIncrease();
     // Provider.of<DepositBrain>(context, listen: false).fetchAndSetData();
     // Provider.of<ProfitDatabase>(context, listen: false).fetchAndSetData();

    final depo = Provider.of<DepositBrain>(context);
    final pos = Provider.of<PosWithdrawalBrain>(context);
    final transfer = Provider.of<TransactionBrain>(context);
    // final profit = Provider.of<ProfitDatabase>(context, listen: false);
    double netProfit = depo.depositIncrease + pos.sumOfIncreaseValue + transfer.sumOfIncreaseValue;
    final profitDb = Provider.of<ProfitDatabase>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        // elevation: 1,
        title: titleText('Dashboard', fontSize: 18),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Container(
            color: Colors.grey,
            height: 2,
          ),
        ),
        actions: [
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed(ProfilePage.id);
            },
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
              DashboardCard(
                cumulativeProfit: profitDb.fetchCumulativeProfit().toStringAsFixed(2),
                todayProfit: netProfit.toStringAsFixed(2),
              ),
              // dashboardCard(context),
              const SizedBox(
                height: 80,
              ),
              titleText("Transaction Type"),
              transactionTypeButton(
                  title: "POS Transactions",
                  onTap: () {
                    Navigator.of(context).pushNamed(POSWithdrawalScreen.id);
                  }),
              SizedBox(
                height: 20.h,
              ),
              transactionTypeButton(
                  title: "Transfer Withdrawal",
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(TransferWithdrawalScreen.id);
                  }),
              SizedBox(
                height: 20.h,
              ),
              transactionTypeButton(
                  title: "Deposits",
                  onTap: () {
                    Navigator.of(context).pushNamed(DepositScreen.id);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
