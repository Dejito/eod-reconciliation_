import 'package:eod_reconcilaton/screens/pos_withdrawal/pos_with_increase_screen.dart';
import 'package:eod_reconcilaton/widgets/widgets.dart';
import 'package:flutter/material.dart';
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
        title: const Text('POS Withdrawals'),
        actions: [
          Container(
            padding: const EdgeInsets.all(12),
            child: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: 16,
              child: Text(
                '${posBrain.transaction.length}',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              focusNode: _amountFocusNode,
              decoration: const InputDecoration(
                label: Text('amount withdrawn'),
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
                label: Text('charged fee'),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _charges = value;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            const PosWithdrawalListview(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTextButton(
                  onPressed: () {
                    if (_charges.isEmpty || _amountWithdrawn.isEmpty) {
                      return;
                    }
                    // FocusScope.of(context).requestFocus(_amountFocusNode);
                    //add transaction to list
                    int? amount = int.tryParse(_amountWithdrawn);
                    posBrain.addTransaction(amount!);
                    //accept amount charged
                    int? amountCharged = int.tryParse(_charges);
                    //calculate increase accrued from the transaction
                    double? posCharges = posBrain.calcIncrease(amount);
                    double increase = amountCharged! - posCharges!;
                    //store the increase to a list
                    posBrain.addIncrease(increase);
                    _charges = '';
                    _amountWithdrawn = '';
                    _amountController.clear();
                    _chargeController.clear();
                    FocusScope.of(context).requestFocus(_amountFocusNode);
                  },
                  label: "Add transaction",
                ),
                buildTextButton(
                    onPressed: () {
                      posBrain.removeIncrease();
                      posBrain.removeTransaction();
                    },
                    label: 'Undo add'),
                // TextButton(
                //     onPressed: () {
                //       if (_charges.isEmpty || _amountWithdrawn.isEmpty) {
                //         return;
                //       }
                //       // FocusScope.of(context).requestFocus(_amountFocusNode);
                //       //add transaction to list
                //       int? amount = int.tryParse(_amountWithdrawn);
                //       posBrain.addTransaction(amount!);
                //       //accept amount charged
                //       int? amountCharged = int.tryParse(_charges);
                //       //calculate increase accrued from the transaction
                //       double? posCharges = posBrain.calcIncrease(amount);
                //       double increase = amountCharged! - posCharges!;
                //       //store the increase to a list
                //       posBrain.addIncrease(increase);
                //       _charges = '';
                //       _amountWithdrawn = '';
                //       _amountController.clear();
                //       _chargeController.clear();
                //       FocusScope.of(context).requestFocus(_amountFocusNode);
                //     },
                //     child: const Text(
                //       'Add transaction',
                //       style: TextStyle(
                //           color: Colors.blueAccent,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 15),
                //     )),
                // TextButton(
                //     onPressed: () {
                //       posBrain.removeIncrease();
                //       posBrain.removeTransaction();
                //     },
                //     child: const Text('Undo add')),
              ],
            ),
            buildElevatedButton2(
              onPressed: () {
                if (posBrain.transaction.isEmpty) {
                  return;
                }
                _chargesFocusNode.unfocus();
                // final totalIncrease = posBrain.sumOfIncreaseValue;
                Navigator.of(context).pushNamed(
                  PosWithIncreaseScreen.id,
                );
              },
              label: "Calculate increase",
            ),

            // ElevatedButton(
            //   onPressed: () {
            //     if (posBrain.transaction.isEmpty) {
            //       return;
            //     }
            //     _chargesFocusNode.unfocus();
            //     // final totalIncrease = posBrain.sumOfIncreaseValue;
            //     Navigator.of(context).pushNamed(
            //       PosWithIncreaseScreen.id,
            //     );
            //   },
            //   child: const Text('Calculate increase'),
            // ),
          ],
        ),
      ),
    );
  }
}
