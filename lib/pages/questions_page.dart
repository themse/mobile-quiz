import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:app1/components/answer_button.dart';
import 'package:app1/data/questions.dart';
import 'package:app1/models/quiz_question.dart';

class QuestionsPage extends StatefulWidget {
  final void Function(String answer) onSelectedAnswer;

  QuestionsPage({super.key, required this.onSelectedAnswer});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectedAnswer(answer);

    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestion currentQuestion = questions[currentQuestionIndex];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      color: Colors.deepPurple[600],
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffledAnswers.map((item) {
              return AnswerButton(
                  label: item, onTap: () => answerQuestion(item));
            }),
          ],
        ),
      ),
    );
  }
}
