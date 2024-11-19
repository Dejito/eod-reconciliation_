import 'package:eod_reconcilaton/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/pos_withdrawal_brain.dart';
import '../../widgets/increase_screen_widget.dart';
import '../tab_screen.dart';

class PosWithIncreaseScreen extends StatelessWidget {
  static const id = 'pos_with_increase_screen';

  const PosWithIncreaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pos = Provider.of<PosWithdrawalBrain>(context);
    final increaseFigure = pos.sumOfIncreaseValue;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: titleText('POS Profit'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5.0),
          // Define the preferred size
          child: Container(
            color: Colors.grey,
            height: 2,
          ),
        ),
      ),
      body: increaseFigure == 0
          ? const Center(
              child: Text('No transactions added yet!'),
            )
          : Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
            // margin: EdgeInsets.symmetric(vertical: 16.w),
            child: IncreaseScreenWidget(
                hintText: 'charge rate is calculated at 0.5% capped at #100',
                increaseFigure: increaseFigure,
                listViewBuilder: ListView.builder(
                  itemBuilder: (context, i) {
                    return Card(
                      elevation: 3,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 0.h, horizontal: 10.w),
                        padding: const EdgeInsets.all(12),
                        // decoration:   const BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            titleText(
                              '${pos.transaction[i]} gives ',
                              textAlign: TextAlign.justify,
                            ),
                            titleText(
                              pos.increase[i].toStringAsFixed(1),
                              textAlign: TextAlign.justify,
                              color: const Color(0xFFF90606)
                            ),
                            titleText(
                              " profit",
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: pos.increase.length,
                ),
              pageNavigator: TabScreen.id,
              ),
          ),
    );
  }
}
