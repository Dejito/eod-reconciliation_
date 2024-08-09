import 'package:flutter/material.dart';

Widget buildElevatedButton(Function() onPressed, String label, Color color) {
  return ElevatedButton(
    style: ButtonStyle(
      elevation: MaterialStateProperty.resolveWith<double>((states) => 0),
      fixedSize: MaterialStateProperty.resolveWith<Size>(
        (states) => const Size(425, 50),
      ),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((states) {
        Color borderColor = color;
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
          return color;
        },
      ),
    ),
    onPressed: onPressed,
    child: Text(
      label,
      style: TextStyle(),
    ),
  );
}
