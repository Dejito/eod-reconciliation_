import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";


showToast({
  required String message,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: backgroundColor,
      textColor: textColor
  );
}
