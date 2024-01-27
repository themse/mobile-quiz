import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:app1/components/result_tile.dart';
import 'package:app1/data/questions.dart';
import 'package:app1/models/summary_data.dart';

class ResultPage extends StatelessWidget {
  final List<String> chosenAnswers;
  final void Function() onRestart;

  const ResultPage({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  List<SummaryData> get summaryDataList {
    final List<SummaryData> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(SummaryData(
        questionIndex: i + 1,
        question: questions[i].question,
        correctAnswer: questions[i].variants[0],
        userAnswer: chosenAnswers[i],
      ));
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions = questions.length;
    final answeredQuestions = summaryDataList
        .where((data) => data.correctAnswer == data.userAnswer)
        .length;

    return Container(
      width: double.infinity,
      color: Colors.deepPurple[600],
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 20),
            child: Text(
              "You answered $answeredQuestions out of $totalQuestions questions correctly",
              style: GoogleFonts.lato(
                fontSize: 24,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: summaryDataList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ResultTile(
                    order: summaryDataList[index].questionIndex.toString(),
                    summaryData: summaryDataList[index],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 50),
            child: TextButton.icon(
                onPressed: onRestart,
                icon: const Icon(
                  Icons.refresh,
                  size: 30,
                ),
                label: const Text("Restart Quiz!"),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 24,
                    ))),
          ),
        ],
      ),
    );
  }
}
