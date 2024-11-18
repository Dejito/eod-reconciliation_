import 'package:eod_reconcilaton/utils/assets.dart';
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
      elevation: 3,
      child: SizedBox(
        width: double.infinity,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle
            // borderRadius: BorderRadius.all(Radius.circular()),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              titleText(
                amount,
                textAlign: TextAlign.center,
                  fontSize: 15,
                endPadding: 6.w
              ),
              const SizedBox(width: 10,),
              Container(
                color: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: titleText(
                    charge,
                    textAlign: TextAlign.center,
                    fontSize: 14,
                  color: Colors.white
                ),
              ),
              Expanded(child: Container()),
              const Icon(
                Icons.delete_outline,
                color: Color(0xFFB40303),
                size: 30,
              ),
              SizedBox(width: 10.w,),

            ],
          ),
        ),
      ),
    );
  }
}

