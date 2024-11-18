import 'package:eod_reconcilaton/screens/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../providers/tf_withdrawal_brain.dart';
import '../../utils/widgets.dart';
import '../../widgets/increase_screen_widget.dart';
import '../dashboard/dashboard.dart';

class TxWithIncreaseScreen extends StatelessWidget {
  static const id = 'tx_with_increase_screen';

  const TxWithIncreaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final txBrain = Provider.of<TransactionBrain>(context);
    final increaseFigure = txBrain.sumOfIncreaseValue;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Withdrawal Profit',
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5.0),
          // Define the preferred size
          child: Container(
            color: Colors.grey,
            height: 2,
          ),
        ),
      ),
      body: increaseFigure <= 0
          ? const Center(child: Text('No transactions added yet!'))
          :
      Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              // margin: EdgeInsets.symmetric(vertical: 16.w),
              child: IncreaseScreenWidget(
                hintText: 'charge rate is calculated at 0.5% capped at #100',
                increaseFigure: increaseFigure.toDouble(),
                listViewBuilder: ListView.builder(
                  itemBuilder: (context, i) {
                    return Card(
                      elevation: 3,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            titleText(
                              '${txBrain.transaction[i]} gives ',
                              textAlign: TextAlign.justify,
                            ),
                            titleText(txBrain.increase[i].toStringAsFixed(1),
                                textAlign: TextAlign.justify,
                                color: const Color(0xFFF90606)),
                            titleText(
                              " profit",
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: txBrain.transaction.length,
                ),
                pageNavigator: TabScreen.id,
              ),
            ),

      // : Column(
      //     children: [
      //       Container(
      //           padding: EdgeInsets.symmetric(horizontal: 16.w),
      //           child:
      //           const Card(
      //               child: Text(
      //             'It is assumed that at least #200 is charged for withdrawal of #10,000. #50 stamp duty is thus deducted for increase figure of #200 and above',
      //             style: TextStyle(fontSize: 13),
      //           ))),
      //       Expanded(
      //           child: ListView.builder(
      //         shrinkWrap: true,
      //         itemBuilder: (context, i) {
      //           return Card(
      //             color: Colors.grey.shade400,
      //             child: Container(
      //               margin: const EdgeInsets.symmetric(
      //                   vertical: 0, horizontal: 10),
      //               padding: const EdgeInsets.all(5),
      //               alignment: Alignment.center,
      //               child: Text(
      //                 '${txBrain.transaction[i]} gives ${txBrain.increase[i]} profit',
      //               ),
      //             ),
      //           );
      //         },
      //         itemCount: txBrain.increase.length,
      //       )),
      //       Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: [
      //             Card(
      //               elevation: 5,
      //               color: Colors.blueAccent,
      //               child: Padding(
      //                 padding: const EdgeInsets.all(5.0),
      //                 child: Text(
      //                   'Total increase $increaseFigure',
      //                   style: const TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 19,
      //                       color: Colors.white),
      //                   textAlign: TextAlign.center,
      //                 ),
      //               ),
      //             ),
      //             TextButton(
      //                 onPressed: () {
      //                   Navigator.of(context)
      //                       .pushReplacementNamed(Dashboard.id);
      //                 },
      //                 child: const Text('Return'))
      //           ])
      //     ],
      //   ),
    );
  }
}
