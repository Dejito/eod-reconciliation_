import 'package:eod_reconcilaton/screens/dashboard/dashboard_widgets.dart';
import 'package:eod_reconcilaton/screens/pos_withdrawal/pos_withdrawal_screen.dart';
import 'package:eod_reconcilaton/screens/transfer_withdrawal/transfer_withdrawal_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/main_drawer.dart';
import '../deposits/deposit_screen.dart';

class Dashboard extends StatelessWidget {
  static const id = 'selection_screen';

  const Dashboard({super.key});

  Widget txCard({required String txType, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        // color: Colors.blueAccent,
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            txType,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }

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
              transactionTypeButton(title: "POS Transactions", onTap: (){
                Navigator.of(context).pushNamed(POSWithdrawalScreen.id);

              }),
              // txCard(
              //     txType: 'POS Transactions',
              //     onTap: () {
              //       Navigator.of(context).pushNamed(POSWithdrawalScreen.id);
              //     }),
              // txCard(
              //     txType: 'Bank Transfer Withdrawals',
              //     onTap: () {
              //       Navigator.of(context).pushNamed(TransferWithdrawalScreen.id);
              //     }),
              // txCard(
              //     txType: 'Deposits',
              //     onTap: () {
              //       Navigator.of(context).pushNamed(DepositScreen.id);
              //     }),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: const [
              //     Text('Select your transaction type')
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
