class SummaryData {
  final int questionIndex;
  final String question;
  final String correctAnswer;
  final String userAnswer;

  const SummaryData({
    required this.questionIndex,
    required this.question,
    required this.correctAnswer,
    required this.userAnswer,
  });

  bool get isCorrectAnswer {
    return correctAnswer == userAnswer;
  }
}
