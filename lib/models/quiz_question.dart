class QuizQuestion {
  final String question;
  final List<String> variants;

  const QuizQuestion(this.question, this.variants);

  List<String> get shuffledAnswers {
    final shuffledList = List.of(variants);
    shuffledList.shuffle();

    return shuffledList;
  }
}
