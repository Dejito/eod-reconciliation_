
import 'package:eod_reconcilaton/screens/pos_withdrawal/pos_withdrawal_screen.dart';
import 'package:eod_reconcilaton/screens/transfer_withdrawal/transfer_withdrawal_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import 'deposits/deposit_screen.dart';

class SelectionScreen extends StatelessWidget {
  static const id = 'selection_screen';

  const SelectionScreen({super.key});

  Widget txCard ({required String txType, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.blueAccent,
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            txType,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transaction Type'
        ),
      ),
      drawer: const MainDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          txCard(
              txType:'POS Transactions',
              onTap: (){
                Navigator.of(context).pushNamed(POSWithdrawalScreen.id);
              }
          ),
          txCard(
              txType:'Bank Transfer Withdrawals',
              onTap: (){
                Navigator.of(context).pushNamed(TransferWithdrawalScreen.id);
              }
          ),
          txCard(
              txType:'Deposits',
              onTap: (){
                Navigator.of(context).pushNamed(DepositScreen.id);
              }
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: const [
          //     Text('Select your transaction type')
          //   ],
          // )
        ],
      ),
    );
  }
}
