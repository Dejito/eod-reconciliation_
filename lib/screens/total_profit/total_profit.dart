import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/deposit_brain.dart';
import '../../providers/pos_withdrawal_brain.dart';
import '../../providers/profit_db.dart';
import '../../providers/tf_withdrawal_brain.dart';
import '../../utils/assets.dart';
import '../../utils/widgets.dart';


class TotalProfit extends StatelessWidget {
  static const id = 'total_profit_screen';
  const TotalProfit({super.key});


  Widget profitContainer({required String profit, required String transactionType}) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleText(
            '$transactionType Profit'
          ),
          titleText(
            profit,
            textAlign: TextAlign.left,
                fontSize: 19
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final depo = Provider.of<DepositBrain>(context, listen: false);
    final pos = Provider.of<PosWithdrawalBrain>(context, listen: false);
    final transfer = Provider.of<TransactionBrain>(context, listen: false);
    final profit = Provider.of<ProfitDatabase>(context, listen: false);
    double netProfit = depo.depositIncrease + pos.sumOfIncreaseValue + transfer.sumOfIncreaseValue;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  titleText('Total Profit'),
      ),
      // body: FutureBuilder(
      //   future: posD,
      //   builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          body: netProfit ==0 ? const Center(
            child: Text('No transactions added yet!'),)
              :
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Column(
              children: [
                Column(
                  children: [
                    profitContainer(
                        transactionType: 'POS',
                        profit: '${pos.sumOfIncreaseValue}'
                    ),
                    profitContainer(
                        transactionType: 'Transfer Withdrawal',
                        profit: '${transfer.sumOfIncreaseValue}'
                    ),
                    profitContainer(
                        transactionType: 'Deposit',
                        profit: '${depo.depositIncrease}'
                    ),
                  ],
                ),
               const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Container(
                      padding:  EdgeInsets.symmetric(horizontal:16.w, vertical: 12),
                      margin:  EdgeInsets.symmetric(horizontal: 9.w, vertical: 6.w),
                      color: AppColors.primaryColor,
                      child: titleText(
                        'Total Profit = $netProfit',
                        // style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: (){
                        pos.saveToDb();
                        transfer.saveToDb();
                        depo.saveToDb();
                        profit.saveToDb(netProfit);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text(
                              'Saved!',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                              backgroundColor: Colors.green,
                            )
                        );                    },
                      child: Row(
                        children: [
                          titleText('SAVE',fontWeight: FontWeight.w500, fontSize: 16,),
                          SizedBox(width: 3.w,),
                          const Icon(
                            Icons.save,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Colors.blue,
                    //     borderRadius: BorderRadius.circular(10)
                    //   ),
                    //   margin: const EdgeInsets.all(10),
                    //   padding: const EdgeInsets.all(11),
                    //   child: Text(
                    //     'Total Profit  $netProfit',
                    //     style: const TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 20.5,
                    //         color: Colors.white
                    //     ),
                    //   ),
                    // ),
                    // ElevatedButton.icon(
                    //   onPressed: () async{
                    //     pos.saveToDb();
                    //     transfer.saveToDb();
                    //     depo.saveToDb();
                    //     profit.saveToDb(netProfit);
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       const SnackBar(content: Text(
                    //         'Saved!',
                    //         style: TextStyle(
                    //           fontSize: 14,
                    //           color: Colors.white,
                    //         ),
                    //         textAlign: TextAlign.center,
                    //       ),
                    //       backgroundColor: Colors.green,
                    //       )
                    //     );
                    //   },
                    //   label: const Text(
                    //     'Save',
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.w600,
                    //         fontSize: 15,
                    //         color: Colors.blueAccent
                    //     ),
                    //   ),
                    //   icon: const Icon(
                    //       Icons.save
                    //   ),
                    // ),
                  ],
                )

              ],
            ),
          ),
    );
  }
}
