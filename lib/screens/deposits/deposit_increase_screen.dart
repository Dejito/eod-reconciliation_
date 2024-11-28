
import 'package:eod_reconcilaton/screens/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/deposit_brain.dart';
import '../../utils/widgets.dart';
import '../../widgets/increase_screen_widget.dart';
import '../dashboard/dashboard.dart';




class DepositIncreaseScreen extends StatelessWidget {
  static const id = 'deposit_increase_screen';

  const DepositIncreaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final depo = Provider.of<DepositBrain>(context);
    final inc = depo.depositIncrease.toDouble();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Deposit Profit'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5.0),
          // Define the preferred size
          child: Container(
            color: Colors.grey,
            height: 2,
          ),
        ),
      ),
      body:depo.deposit.isEmpty ?
      const Center(child: Text(
          'No transactions added yet!'
      )) :
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        // margin: EdgeInsets.symmetric(vertical: 16.w),
        child: IncreaseScreenWidget(
          hintText: 'charge rate is calculated at 0.5% capped at #100',
          increaseFigure: inc.toDouble(),
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
                        '${depo.deposit[i]} gives ',
                        textAlign: TextAlign.justify,
                      ),
                      titleText(depo.increase[i].toStringAsFixed(1),
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
            itemCount: depo.deposit.length,
          ),
          pageNavigator: TabScreen.id,
        ),
      ),
    );
  }
}
