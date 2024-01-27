import 'package:flutter/material.dart';

import 'package:app1/data/questions.dart';
import 'package:app1/pages/questions_page.dart';
import 'package:app1/pages/result_page.dart';
import 'package:app1/pages/start_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  String activePage = 'start';

  Map<String, Widget> pages = {};

  @override
  void initState() {
    pages = {
      'start': StartPage(onStart: () => switchPage('question')),
      'question': QuestionsPage(
        onSelectedAnswer: chooseAnswers,
      ),
      'result': ResultPage(
        chosenAnswers: selectedAnswers,
        onRestart: () => switchPage('start'),
      ),
    };

    super.initState();
  }

  void switchPage(String pageName) {
    setState(() {
      if (pageName == 'start') {
        selectedAnswers = [];
      }
      activePage = pageName;
    });
  }

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activePage = 'result';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: pages[activePage]),
    );
  }
}
