import 'package:eod_reconcilaton/utils/assets.dart';
import 'package:flutter/material.dart';

Widget buildElevatedButton(
    {required Function() onPressed,
    required String label,
    required Color buttonColor,
    required Color borderColor,
    required Color textColor}) {
  return ElevatedButton(
    style: ButtonStyle(
      elevation: MaterialStateProperty.resolveWith<double>((states) => 0),
      fixedSize: MaterialStateProperty.resolveWith<Size>(
        (states) => const Size(425, 50),
      ),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((states) {
        // Color borderColor = borderColor;
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(width: 2, color: borderColor),
        );
      }),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          // if (states.contains(MaterialState.disabled) || onPressed == null) {
          //   return (color ?? AppColors.iAmAliveBlue.withOpacity(0.2));
          // }
          return buttonColor;
        },
      ),
    ),
    onPressed: onPressed,
    child: Text(
      label,
      style: TextStyle(
          color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );
}

Widget buildElevatedButton2(
    {required Function() onPressed,
    required String label,
    Color buttonColor = AppColors.primaryColor,
    Color textColor = Colors.white}) {
  return ElevatedButton(
    style: ButtonStyle(
      elevation: MaterialStateProperty.resolveWith<double>((states) => 0),
      fixedSize: MaterialStateProperty.resolveWith<Size>(
        (states) => const Size(300, 30),
      ),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((states) {
        // Color borderColor = borderColor;
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(width: 2, color: buttonColor),
        );
      }),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          // if (states.contains(MaterialState.disabled) || onPressed == null) {
          //   return (color ?? AppColors.iAmAliveBlue.withOpacity(0.2));
          // }
          return buttonColor;
        },
      ),
    ),
    onPressed: onPressed,
    child: Text(
      label,
      style: TextStyle(
          color: textColor, fontWeight: FontWeight.bold, fontSize: 14),
    ),
  );
}

Widget buildTextButton({required Function() onPressed, required String label}) {
  return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 15),
      ));
}
