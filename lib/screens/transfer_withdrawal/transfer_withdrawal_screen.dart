import 'package:eod_reconcilaton/screens/transfer_withdrawal/tx_with_increase_screen.dart';
import 'package:eod_reconcilaton/utils/widgets.dart';
import 'package:eod_reconcilaton/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../utils/assets.dart';
import '../../utils/toast.dart';
import '../../widgets/transaction_list_view.dart';
import '../../providers/tf_withdrawal_brain.dart';

class TransferWithdrawalScreen extends StatefulWidget {
  static const id = 'transfer_withdrawal';

  const TransferWithdrawalScreen({super.key});

  @override
  State<TransferWithdrawalScreen> createState() =>
      _TransferWithdrawalScreenState();
}

class _TransferWithdrawalScreenState extends State<TransferWithdrawalScreen> {
  @override
  void dispose() {
    _amountFocusNode.dispose();
    _chargesFocusNode.dispose();
    _amountController.dispose();
    _chargesController.dispose();
    super.dispose();
  }

  final _amountController = TextEditingController();
  final _chargesController = TextEditingController();
  var _txAmount = '';
  var _chargeFee = '';
  final _chargesFocusNode = FocusNode();
  final _amountFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final txBrain = Provider.of<TransactionBrain>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: titleText('Transfer Withdrawal', fontSize: 16),
        actions: [
          Container(
            padding: const EdgeInsets.all(12),
            child: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 16,
              child: Text(
                '${txBrain.transaction.length}',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          children: [
            TextField(
              focusNode: _amountFocusNode,
              keyboardType: TextInputType.number,
              controller: _amountController,
              decoration: const InputDecoration(
                label: Text('amount withdrawn'),
              ),
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(_chargesFocusNode);
              },
              onChanged: (value) {
                try {
                  _txAmount = value;
                } catch (e) {
                  rethrow;
                }
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              focusNode: _chargesFocusNode,
              keyboardType: TextInputType.number,
              controller: _chargesController,
              decoration: const InputDecoration(
                label: Text('charged fee'),
              ),
              onChanged: (value) {
                try {
                  _chargeFee = value;
                } catch (e) {
                  rethrow;
                }
              },
            ),
            SizedBox(height: 10.h,),
            InkWell(
              onTap: (){
                if (_chargeFee.isEmpty || _txAmount.isEmpty) {
                  showToast(message: "Fields cannot be empty");
                  return;
                }
                int? amount = int.tryParse(_txAmount);
                //add to transaction list
                txBrain.addTransaction(amount!);
                //convert string of amount withdrawn to int
                int? chargesValue = int.tryParse(_chargeFee);
                txBrain.addCharges(chargesValue!);

                //put calculate result method here
                double? increase = txBrain
                    .calculateTransferWithdrawalIncrease(amount);
                double increaseValue = chargesValue! - increase!;

                txBrain.addIncrease(increaseValue);
                // add the increase to a list

                _amountController.clear();
                _chargesController.clear();
                _txAmount = '';
                _chargeFee = '';
                FocusScope.of(context).requestFocus(_amountFocusNode);
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
            const SizedBox(
              height: 15,
            ),
            const TransactionsListView(),
            buildElevatedButton2(
              onPressed: () {
                if (txBrain.transaction.isEmpty) {
                  return;
                }
                final inCreaseValue = txBrain.sumOfIncreaseValue;
                Navigator.of(context).pushNamed(TxWithIncreaseScreen.id,
                    arguments: inCreaseValue);
              },
              label: 'Calculate increase',
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     if (txBrain.transaction.isEmpty) {
            //       return;
            //     }
            //     final inCreaseValue = txBrain.sumOfIncreaseValue;
            //     Navigator.of(context).pushNamed(TxWithIncreaseScreen.id,
            //         arguments: inCreaseValue);
            //   },
            //   child: const Text('Calculate increase'),
            // ),
          ],
        ),
      ),
    );
  }
}
