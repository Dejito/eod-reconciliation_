import 'package:flutter/material.dart';





Widget dashboardCard(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    clipBehavior: Clip.none,
    children: [
      Container(
        height: 100,
        width: double.infinity,
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text properly
                  children: [
                    Text("Bliss"),
                    Text("0012345678")
                  ],
                ),
                SizedBox(width: 6),
                Icon(Icons.chevron_right),
              ],
            ),
            Icon(Icons.notifications_none),
          ],
        ),
      ),
      Positioned(
        top: 40,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9, // Constrain width
          height: 100,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blue,
          ),
          child: Text(
            "Cumu profit",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    ],
  );
}
