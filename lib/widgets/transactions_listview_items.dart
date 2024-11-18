import 'package:eod_reconcilaton/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionsListviewItems extends StatelessWidget {

  final String amount;
  final String charge;

  const TransactionsListviewItems({super.key, required this.amount, required this.charge});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade300,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  titleText(
                    '#$amount',
                    textAlign: TextAlign.center,
                      fontSize: 18
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: titleText(
                        '#$amount',
                        textAlign: TextAlign.center,
                        fontSize: 18
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

