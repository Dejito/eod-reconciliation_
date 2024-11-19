import 'package:eod_reconcilaton/widgets/transactions_listview_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/pos_withdrawal_brain.dart';



class PosWithdrawalListview extends StatelessWidget {
  const PosWithdrawalListview({super.key});

  @override
  Widget build(BuildContext context) {
    final pos = Provider.of<PosWithdrawalBrain>(context);
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          reverse: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return Dismissible(
              key: ValueKey(pos.transaction[i]),
              direction: DismissDirection.startToEnd,
              onDismissed: (dismissed){
                pos.removeTransDismissible(pos.transaction[i]);
                pos.removeIncreaseDismissible(pos.charges[i]);
              },
              background: Container(
                margin:  EdgeInsets.only(top: 16.h),
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.error,
                  borderRadius: BorderRadius.circular(4)
                ),
                alignment: Alignment.centerLeft,
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              child: TransactionsListviewItems(
                amount:pos.transaction[i].toString(),
                charge: pos.charges[i].toString(),
                onDelete: (){
                  pos.removeTransDismissible(pos.transaction[i]);
                  pos.removeIncreaseDismissible(pos.charges[i]);
                },
              ),
            );
          },
          itemCount: pos.transaction.length,
        ),
      ),
    );
  }
}
