import 'package:flutter/material.dart';

class TransactionsListviewItems extends StatelessWidget {

  final String text;
  const TransactionsListviewItems({super.key, required this.text});

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
              Text(
                '#$text',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

