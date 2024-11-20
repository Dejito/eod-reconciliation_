import 'package:eod_reconcilaton/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/deposit_brain.dart';
import '../../utils/assets.dart';
import '../../utils/toast.dart';
import '../../utils/widgets.dart';
import '../../widgets/deposit_listview.dart';
import 'deposit_increase_screen.dart';

class DepositScreen extends StatefulWidget {
  static const id = 'deposit_screen';

  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  @override
  void dispose() {
    _chargesFocusNode.dispose();
    _depositFocusNode.dispose();
    _chargesController.dispose();
    _depositController.dispose();
    super.dispose();
  }

  final _depositFocusNode = FocusNode();
  final _chargesFocusNode = FocusNode();
  final _depositController = TextEditingController();
  final _chargesController = TextEditingController();
  var _deposit = '';
  var _charges = '';

  @override
  Widget build(BuildContext context) {
    final depoBrain = Provider.of<DepositBrain>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit Screen'),
        actions: [
          Container(
            padding: const EdgeInsets.all(12),
            child: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 16,
              child: Text(
                '${depoBrain.deposit.length}',
                style: const TextStyle(
                  color: Colors.white,
                ),
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
              controller: _depositController,
              keyboardType: TextInputType.number,
              focusNode: _depositFocusNode,
              decoration: const InputDecoration(
                label: Text('deposit amount'),
              ),
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(_chargesFocusNode);
              },
              onChanged: (value) {
                _deposit = value;
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
                _charges = value;
              },
            ),
            SizedBox(height: 10.h,),
            InkWell(
              onTap: (){
                if (_deposit.isEmpty || _charges.isEmpty) {
                  showToast(message: "Fields cannot be empty");
                  return;
                }
                int? depoAmount = int.tryParse(_deposit);
                //add deposit to a list
                depoBrain.addDeposit(depoAmount!);
                //calculate profit
                int? chargedFee = int.tryParse(_charges);
                int? increase = depoBrain.calcProfit(chargedFee!);
                //add to list
                depoBrain.addIncrease(increase!);
                depoBrain.addCharges(chargedFee);
                _charges = '';
                _deposit = '';
                _depositController.clear();
                _chargesController.clear();
                FocusScope.of(context).requestFocus(_depositFocusNode);
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
            const DepositListView(),
            buildElevatedButton2(
              onPressed: () {
                if (depoBrain.deposit.isEmpty) {
                  return;
                }
                Navigator.of(context).pushNamed(DepositIncreaseScreen.id);
              },
              label: 'Calculate increase',
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     if (depoBrain.deposit.isEmpty) {
            //       return;
            //     }
            //     Navigator.of(context).pushNamed(DepositIncreaseScreen.id);
            //   },
            //   child: const Text('Calculate increase'),
            // ),
          ],
        ),
      ),
    );
  }
}
