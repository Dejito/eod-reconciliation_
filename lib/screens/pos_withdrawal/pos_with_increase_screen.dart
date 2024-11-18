import 'package:eod_reconcilaton/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/pos_withdrawal_brain.dart';
import '../../widgets/increase_screen_widget.dart';
import '../dashboard/dashboard.dart';

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
        title: const Text('POS Profit'),
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
                    // return Card(
                    //   elevation: 3,
                    //   child: SizedBox(
                    //     width: double.infinity,
                    //     child: Container(
                    //       padding: const EdgeInsets.all(8),
                    //       decoration: const BoxDecoration(
                    //           shape: BoxShape.circle
                    //         // borderRadius: BorderRadius.all(Radius.circular()),
                    //       ),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Expanded(child: Container()),
                    //           titleText(
                    //               amount,
                    //               textAlign: TextAlign.center,
                    //               fontSize: 15,
                    //               endPadding: 6.w
                    //           ),
                    //           const SizedBox(width: 10,),
                    //           Container(
                    //             color: AppColors.primaryColor,
                    //             padding: EdgeInsets.symmetric(horizontal: 6.w),
                    //             child: titleText(
                    //                 charge,
                    //                 textAlign: TextAlign.center,
                    //                 fontSize: 14,
                    //                 color: Colors.white
                    //             ),
                    //           ),
                    //           Expanded(child: Container()),
                    //           const Icon(
                    //             Icons.delete_outline,
                    //             color: Color(0xFFB40303),
                    //             size: 30,
                    //           ),
                    //           SizedBox(width: 10.w,),
                    //
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // );
            
                    return Card(
                      elevation: 3,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 10.w),
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
                pageNavigator: Dashboard.id,
              ),
          ),
    );
  }
}
