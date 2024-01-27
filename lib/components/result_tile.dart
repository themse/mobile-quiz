import 'package:flutter/material.dart';

import 'package:app1/models/summary_data.dart';

class ResultTile extends StatelessWidget {
  final String order;
  final SummaryData summaryData;

  const ResultTile({super.key, required this.order, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    final itemColor = summaryData.isCorrectAnswer ? Colors.green : Colors.red;

    return ListTile(
      leading: CircleAvatar(
          backgroundColor: itemColor,
          child: Text(
            order,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
      title: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Text(
          summaryData.question,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            summaryData.userAnswer,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: itemColor,
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          Text(
            summaryData.correctAnswer,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
