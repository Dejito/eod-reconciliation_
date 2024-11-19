import 'package:eod_reconcilaton/widgets/transactions_listview_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/deposit_brain.dart';

class DepositListView extends StatelessWidget {
  const DepositListView({super.key});

  @override
  Widget build(BuildContext context) {
    final depo = Provider.of<DepositBrain>(context);
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, i) {
          return Dismissible(
            key: ValueKey(depo.deposit[i]),
            direction: DismissDirection.startToEnd,
            onDismissed: (dismissed) {
              depo.removeTransDismissible(depo.deposit[i]);
              depo.removeIncreaseDismissible(depo.charges[i]);
            },
            background: Container(
              margin: const EdgeInsets.only(top: 3),
              padding: const EdgeInsets.only(left: 12),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error,
                  borderRadius: BorderRadius.circular(4)),
              alignment: Alignment.centerLeft,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 30,
              ),
            ),
            child: TransactionsListviewItems(
              amount: depo.deposit[i].toString(),
              charge: depo.charges[i].toString(),
              onDelete: (){
                depo.removeTransDismissible(depo.deposit[i]);
                depo.removeIncreaseDismissible(depo.charges[i]);
              },
            ),
          );
        },
        itemCount: depo.deposit.length,
      ),
    );
  }
}
