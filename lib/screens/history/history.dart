import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/deposit_brain.dart';
import '../../providers/pos_withdrawal_brain.dart';
import '../../providers/profit_db.dart';
import '../../providers/tf_withdrawal_brain.dart';

class History extends StatefulWidget {
  static const id = 'history';

  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  bool isLoaded = false;

  @override
  void didChangeDependencies() async {

    if(!isLoaded) {
      await Provider.of<TransactionBrain>(context, listen: false).fetchAndSetData();
      await Provider.of<PosWithdrawalBrain>(context,listen: false).fetchAndSetIncrease();
      await Provider.of<DepositBrain>(context, listen: false).fetchAndSetData();
      await Provider.of<ProfitDatabase>(context, listen: false).fetchAndSetData();
      Navigator.of(context).pushNamed(History.id);
    }
    isLoaded = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final pos = Provider.of<PosWithdrawalBrain>(context, listen: false);
    final posDB = pos.databaseTransactions;
    final transferDb = Provider.of<TransactionBrain>(context, listen: false)
        .databaseTransactions;
    final depoDb =
        Provider.of<DepositBrain>(context, listen: false).databaseTransactions;
    final profitDb = Provider.of<ProfitDatabase>(context).profit;
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            child: FutureBuilder(
              future: pos.fetchAndSetIncrease(),
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting ||
                          posDB.isEmpty
                      ? const Center(
                          child: Text('No transactions added yet!'),
                        )
                      : SingleChildScrollView(
                          // reverse: true,
                          controller: controller,
                          // physics: NeverScrollableScrollPhysics(),
                          child: ListView.builder(
                            reverse: true,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, i) {
                              return Card(
                                color: Colors.amberAccent.shade100,
                                child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Text(
                                          posDB[i].id.substring(0, 11),
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'POS increase is ${posDB[i].increaseAmount.toString()}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Transfer withdrawal increase is  ${transferDb[i].increaseAmount.toString()}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Deposit increase is  ${depoDb[i].increaseAmount.toString()}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Total increase is  ${profitDb[i].increaseAmount.toString()}',
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )),
                              );
                            },
                            itemCount: pos.databaseTransactions.length,
                          ),
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
