import 'package:eod_reconcilaton/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/deposit_brain.dart';
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
              backgroundColor: Colors.blueAccent,
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
            const SizedBox(
              height: 15,
            ),
            const DepositListView(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTextButton(
                  onPressed: () {
                    if (_deposit.isEmpty || _charges.isEmpty) {
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
                    depoBrain.
                    _charges = '';
                    _deposit = '';
                    _depositController.clear();
                    _chargesController.clear();
                    FocusScope.of(context).requestFocus(_depositFocusNode);
                  },
                  label: 'Add transaction',
                ),
                buildTextButton(
                  onPressed: () {
                    depoBrain.removeFromList();
                  },
                  label: 'Undo add',
                ),
                // TextButton(
                //     onPressed: () {
                //       if (_deposit.isEmpty || _charges.isEmpty) {
                //         return;
                //       }
                //       int? depoAmount = int.tryParse(_deposit);
                //       //add deposit to a list
                //       depoBrain.addDeposit(depoAmount!);
                //       //calculate profit
                //       int? chargedFee = int.tryParse(_charges);
                //       int? increase = depoBrain.calcProfit(chargedFee!);
                //       //add to list
                //       depoBrain.addIncrease(increase!);
                //
                //       _charges = '';
                //       _deposit = '';
                //       _depositController.clear();
                //       _chargesController.clear();
                //       FocusScope.of(context).requestFocus(_depositFocusNode);
                //     },
                //     child: const Text('Add transaction')),
                // TextButton(
                //     onPressed: () {
                //       depoBrain.removeFromList();
                //     },
                //     child: const Text('Undo add')),
              ],
            ),
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
