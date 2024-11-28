
import 'package:eod_reconcilaton/screens/tab_screen.dart';
import 'package:eod_reconcilaton/utils/assets.dart';
import 'package:eod_reconcilaton/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/deposit_brain.dart';
import '../providers/pos_withdrawal_brain.dart';
import '../providers/profit_db.dart';
import '../providers/tf_withdrawal_brain.dart';
import '../screens/deposits/deposit_increase_screen.dart';
import '../screens/history/history.dart';
import '../screens/pos_withdrawal/pos_with_increase_screen.dart';
import '../screens/total_profit/total_profit.dart';
import '../screens/transfer_withdrawal/tx_with_increase_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget customListTile({required Function() onTap, required String txType, required IconData icon}) {
    return ListTile(
      leading:  Icon(
          icon,
        color: AppColors.primaryColor,
      ),
      title: titleText(
        txType,
        fontSize: 15.sp,
        color: const Color(0xFF000000)
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
              height: 100.h,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: AppColors.primaryColor,
              child: titleText ('POS Buddy',
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            customListTile(
              txType: 'Home',
              icon: Icons.home_outlined,
              onTap: (){
                Navigator.of(context).pushNamed(TabScreen.id);
              },
            ),
            const Divider(thickness: 1,),
            customListTile(
                txType: 'POS Profit',
                icon: Icons.point_of_sale,
                onTap: (){
              Navigator.of(context).pushNamed(PosWithIncreaseScreen.id);
            },
            ),
            const Divider(thickness: 1,),
            customListTile(
              txType: 'Transfer Withdrawal Profit',
              icon: Icons.money,
              onTap: (){
                Navigator.of(context).pushNamed(TxWithIncreaseScreen.id);
              },
            ),
            const Divider(thickness: 1,),
            customListTile(
              txType: 'Deposit Profit',
              icon: Icons.monetization_on,
              onTap: (){
                Navigator.of(context).pushNamed(DepositIncreaseScreen.id);
              },
            ),
            const Divider(thickness: 1,),

            customListTile(
              txType: 'Total Profit ',
              icon: Icons.calculate_outlined,
              onTap: (){
                Navigator.of(context).pushNamed(TotalProfit.id);
              },
            ),
            // const Divider(thickness: 1,),
            // customListTile(
            //   txType: 'History',
            //   icon: Icons.history,
            //   onTap: () async {
            //     if(context.mounted) {
            //       await Provider.of<TransactionBrain>(context, listen: false).fetchAndSetData();
            //       await Provider.of<PosWithdrawalBrain>(context,listen: false).fetchAndSetIncrease();
            //       await Provider.of<DepositBrain>(context, listen: false).fetchAndSetData();
            //       await Provider.of<ProfitDatabase>(context, listen: false).fetchAndSetData();
            //       Navigator.of(context).pushNamed(History.id);
            //     }
            //   },
            // ),
            const Divider(thickness: 1,),
            customListTile(
              txType: 'Logout',
              icon: Icons.logout,
              onTap: (){

                // Navigator.of(context).pushNamed(TotalProfit.id);
              },
            ),
            const Divider(thickness: 1,),
          ],
        ),
      ),
    );
  }
}
