import 'package:eod_reconcilaton/utils/assets.dart';
import 'package:eod_reconcilaton/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncreaseScreenWidget extends StatelessWidget {
  final String hintText;
  final double increaseFigure;
  final Widget listViewBuilder;
  final String pageNavigator;

  const IncreaseScreenWidget(
      {super.key,
      required this.hintText,
      required this.increaseFigure,
      required this.listViewBuilder,
      required this.pageNavigator});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child:
              titleText(hintText, textAlign: TextAlign.center, fontSize: 13.sp
                  // style: const TextStyle(fontSize: 13),
                  ),
        ),
        Expanded(child: listViewBuilder),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding:  EdgeInsets.symmetric(horizontal:16.w, vertical: 12),
              margin:  EdgeInsets.symmetric(horizontal: 9.w, vertical: 6.w),
              color: AppColors.primaryColor,
              child: titleText(
                'Total Profit = ${increaseFigure.toStringAsFixed(1)}',
                // style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
              // textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pushReplacementNamed(pageNavigator);
              },
              child: Row(
                children: [
                  titleText('BACK',fontWeight: FontWeight.w500, fontSize: 16,),
                  SizedBox(width: 3.w,),
                  const Icon(
                    Icons.save,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// {txBrain.transaction[i]}
// {txBrain.increase[i]}

// ListView.builder(
// itemBuilder: (context, i){
// return Card(
// child: Container(
// margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
// padding: const EdgeInsets.all(5),
// child: Text(
// '$txTypeIndex gives $txProfitIndex profit',
// ),
// ),
// );
// },
// itemCount: listViewLength,
// )
