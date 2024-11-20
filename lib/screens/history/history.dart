import 'package:eod_reconcilaton/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    }
    isLoaded = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final pos = Provider.of<PosWithdrawalBrain>(context, listen: false);
    final sqlDb = pos.databaseTransactions;
    final transferDb = Provider.of<TransactionBrain>(context, listen: false)
        .databaseTransactions;
    final depoDb =
        Provider.of<DepositBrain>(context, listen: false).databaseTransactions;
    final profitDb = Provider.of<ProfitDatabase>(context).profit;
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: titleText('History', fontSize: 16.sp),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          // Define the preferred size
          child: Container(
            color: Colors.grey,
            height: 2,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: FutureBuilder(
          future: pos.fetchAndSetIncrease(),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting ||
                      sqlDb.isEmpty
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
                          return Column(
                            children: [
                              _profitText(
                                "  ${sqlDb[i].id.substring(0, 11)}",""
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: Card(
                                  elevation: 4,
                                  color: Colors.white,
                                  child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 12.h, horizontal: 5.w),
                                      padding: EdgeInsets.all(6.w),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          titleText(
                                              "Total Profit is ${profitDb[i].increaseAmount.toStringAsFixed(1)}"),
                                          SizedBox(height: 6.h,),

                                          _profitText("POS Profit is", sqlDb[i].increaseAmount.toStringAsFixed(1)),

                                          _profitText("Withdrawal Profit is", transferDb[i].increaseAmount.toStringAsFixed(1)),

                                          _profitText("Deposit Profit is", depoDb[i].increaseAmount.toStringAsFixed(1)),

                                        ],
                                      )),
                                ),
                              ),
                              SizedBox(height: 10.h,),

                            ],
                          );
                        },
                        itemCount: pos.databaseTransactions.length,
                      ),
                    ),
        ),
      ),
    );
  }
}


Widget _profitText(String leading, String trailing){
  return Padding(
    padding: const EdgeInsets.only(bottom: 4.0),
    child: Row(
      children: [
        titleText(leading, fontSize: 13),
        titleText(" $trailing", color: const Color(0xFFB40303), fontSize: 13)

      ],
    ),
  );
}