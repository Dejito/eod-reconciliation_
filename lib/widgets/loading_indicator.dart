
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void showLoadingIndicator(){
  EasyLoading.show(
      indicator: const CircularProgressIndicator(
        color: Colors.blueAccent,
      ),
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: true
  );
}

void dismissLoadingIndicator(){
  EasyLoading.dismiss();
}