import 'package:eod_reconcilaton/screens/pos_withdrawal/pos_with_increase_screen.dart';
import 'package:eod_reconcilaton/utils/assets.dart';
import 'package:eod_reconcilaton/utils/toast.dart';
import 'package:eod_reconcilaton/utils/widgets.dart';
import 'package:eod_reconcilaton/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/pos_withdrawal_brain.dart';
import '../../widgets/pos_withdrawal_listview.dart';

class POSWithdrawalScreen extends StatefulWidget {
  static const id = 'pos_withdrawal_screen';

  const POSWithdrawalScreen({super.key});

  @override
  State<POSWithdrawalScreen> createState() => _POSWithdrawalScreenState();
}

class _POSWithdrawalScreenState extends State<POSWithdrawalScreen> {
  @override
  void dispose() {
    _chargesFocusNode.dispose();
    _amountFocusNode.dispose();
    _amountController.dispose();
    _chargeController.dispose();
    super.dispose();
  }

  final _amountController = TextEditingController();
  final _chargeController = TextEditingController();
  final _chargesFocusNode = FocusNode();
  final _amountFocusNode = FocusNode();
  var _amountWithdrawn = '';
  var _charges = '';

  @override
  Widget build(BuildContext context) {
    final posBrain = Provider.of<PosWithdrawalBrain>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: titleText(
          "POS Transactions",
          // style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5.0),
          // Define the preferred size
          child: Container(
            color: Colors.grey,
            height: 2,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Container(
              padding: EdgeInsets.all(6.w),
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: titleText('${posBrain.transaction.length}',
                  color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          children: [
            SizedBox(
              height: 12.h,
            ),
            TextField(
              controller: _amountController,
              focusNode: _amountFocusNode,
              decoration: const InputDecoration(
                label: Text('Amount withdrawn'),
              ),
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(_chargesFocusNode);
              },
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _amountWithdrawn = value;
              },
            ),

            const SizedBox(height: 15),

            TextField(
              focusNode: _chargesFocusNode,
              controller: _chargeController,
              decoration: const InputDecoration(
                label: Text('Charge Fee'),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _charges = value;
              },
            ),
            SizedBox(height: 10.h,),
            InkWell(
              onTap: (){
                if (_charges.isEmpty || _amountWithdrawn.isEmpty) {
                  showToast(message: "Fields cannot be empty");
                  return;
                }
                // FocusScope.of(context).requestFocus(_amountFocusNode);
                //add transaction to lit
                var validation = false;
                int? amount = int.tryParse(_amountWithdrawn);
                posBrain.addTransaction(amount!);
                //accept amount charged
                int? amountCharged = int.tryParse(_charges);
                //calculate increase accrued from the transaction
                double? posCharges = posBrain.calcIncrease(amount);
                double increase = amountCharged! - posCharges!;
                //store the increase to a list
                posBrain.addIncrease(increase);
                posBrain.addCharges(amountCharged);
                _charges = '';
                _amountWithdrawn = '';
                _amountController.clear();
                _chargeController.clear();
                FocusScope.of(context).requestFocus(_amountFocusNode);
                validation = true;
                if (validation==false) {
                  showToast(message: "Invalid amount");

                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.add,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  titleText(
                    'Add Transaction',
                    // fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const PosWithdrawalListview(),
            buildElevatedButton2(
              onPressed: () {
                if (posBrain.transaction.isEmpty) {
                  return;
                }
                _chargesFocusNode.unfocus();
                posBrain.sumOfIncreaseValue;
                Navigator.of(context).pushNamed(
                  PosWithIncreaseScreen.id,
                );
              },
              label: "Calculate increase",
            ),
          ],
        ),
      ),
    );
  }
}
