import 'package:eod_reconcilaton/widgets/transactions_listview_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tf_withdrawal_brain.dart';


class TransactionsListView extends StatelessWidget {
  const TransactionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final txBrain = Provider.of<TransactionBrain>(context);
    return  Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          reverse: true,
          itemBuilder: (context, i){
          return Dismissible(
            key:  ValueKey(txBrain.transaction[i]),
            direction: DismissDirection.startToEnd,
            onDismissed: (dismissDirection){
              txBrain.removeByDismissibleTransaction(txBrain.transaction[i]);
              txBrain.removeByDismissibleIncrease(txBrain.increase[i]);
              txBrain.removeByDismissibleCharges(txBrain.charges[i]);
            },
            background: Container(
              margin: const EdgeInsets.only(top: 3),
              padding: const EdgeInsets.only(left: 12,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Theme.of(context).colorScheme.error,
              ),
              alignment: Alignment.centerLeft,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 30,
              ),
            ),
            child: TransactionsListviewItems(
              amount:txBrain.transaction[i].toString(),
              charge: txBrain.charges[i].toString(),
              onDelete: (){
                txBrain.removeByDismissibleTransaction(txBrain.transaction[i]);
                txBrain.removeByDismissibleIncrease(txBrain.increase[i]);
                txBrain.removeByDismissibleCharges(txBrain.charges[i]);

              },
            ),
          );
        },
          itemCount: txBrain.transaction.length,
        ),
      ),
    );
  }
}
