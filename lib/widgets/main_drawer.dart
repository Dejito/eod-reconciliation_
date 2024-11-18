
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/deposit_brain.dart';
import '../providers/pos_withdrawal_brain.dart';
import '../providers/profit_db.dart';
import '../providers/tf_withdrawal_brain.dart';
import '../screens/deposits/deposit_increase_screen.dart';
import '../screens/history.dart';
import '../screens/pos_withdrawal/pos_with_increase_screen.dart';
import '../screens/dashboard.dart';
import '../screens/total_profit/total_profit.dart';
import '../screens/transfer_withdrawal/tx_with_increase_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget listTile({required Function() onTap, required String txType, required IconData icon}) {
    return ListTile(
      leading:  Icon(
          icon,
        color: Colors.blueAccent,
      ),
      title: Text(
        txType,
        style: const TextStyle(
            fontSize: 17
        ),
      ),
      onTap: onTap
      
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Colors.blueAccent.shade100,
              child: const Text ('EOD Reconciliation!',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            listTile(
              txType: 'Home',
              icon: Icons.home_outlined,
              onTap: (){
                Navigator.of(context).pushNamed(Dashboard.id);
              },
            ),
            const Divider(thickness: 1,),
            listTile(
                txType: 'POS Profit',
                icon: Icons.calculate,
                onTap: (){
              Navigator.of(context).pushNamed(PosWithIncreaseScreen.id);
            },
            ),
            const Divider(thickness: 1,),
            listTile(
              txType: 'Transfer Withdrawal Profit',
              icon: Icons.money,
              onTap: (){
                Navigator.of(context).pushNamed(TxWithIncreaseScreen.id);
              },
            ),
            const Divider(thickness: 1,),
            listTile(
              txType: 'Deposit Profit',
              icon: Icons.monetization_on,
              onTap: (){
                Navigator.of(context).pushNamed(DepositIncreaseScreen.id);
              },
            ),
            const Divider(thickness: 1,),

            listTile(
              txType: 'Total Profit ',
              icon: Icons.calendar_today,
              onTap: (){
                Navigator.of(context).pushNamed(TotalProfit.id);
              },
            ),
            const Divider(thickness: 1,),
            listTile(
              txType: 'History',
              icon: Icons.history,
              onTap: () async{
                await Provider.of<TransactionBrain>(context, listen: false).fetchAndSetData();
                await Provider.of<PosWithdrawalBrain>(context,listen: false).fetchAndSetIncrease();
                await Provider.of<DepositBrain>(context, listen: false).fetchAndSetData();
                await Provider.of<ProfitDatabase>(context, listen: false).fetchAndSetData();
                Navigator.of(context).pushNamed(History.id);
              },
            ),
            const Divider(thickness: 1,),
          ],
        ),
      ),
    );
  }
}
