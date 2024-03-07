
// define model or blueprint for a question and its answers
class QuizModel {
  const QuizModel({
    required this.question,
    required this.answers,
  });

  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    // final shuffled = [...answers];
    final shuffled = List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }
}