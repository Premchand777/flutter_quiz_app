// import flutter pkgs
import 'package:flutter/material.dart';

// import 3rd party pkgs
import 'package:google_fonts/google_fonts.dart';
// import 'package:f_logs/f_logs.dart';

// import project pkgs
import 'package:flutter_quiz/data/questions_answers.dart';
import 'package:flutter_quiz/models/quiz_model.dart';
import 'package:flutter_quiz/reusable_widgets/answer_button.dart';

// questions custom stateful widget
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.changeScreen,
  });

  final void Function(
    String screenName,
    int? correctAnswers,
    List<Map<String, dynamic>>? resultSummary,
  ) changeScreen;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  final List<String> selectedAnswers = [];

  @override
  Widget build(BuildContext context) {
    final QuizModel currentQuizQuestion =
        questionsAnswers[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuizQuestion.question,
              style: GoogleFonts.rubik(
                color: Colors.white,
                fontSize: 18,
                letterSpacing: 1,
                wordSpacing: 1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuizQuestion
                .getShuffledAnswers()
                .map((answer) => AnswerButton(
                      answer: answer,
                      nextQuestion: () {
                        selectedAnswers.add(answer);
                        if (selectedAnswers.length == questionsAnswers.length) {
                          final List<Map<String, dynamic>> resultSummary = [];
                          int rightAnswers = 0;
                          for (int i = 0; i < selectedAnswers.length; i++) {
                            resultSummary.add({
                              'questionNo': i + 1,
                              'question': questionsAnswers[i].question,
                              'correctAnswer': questionsAnswers[i].answers[0],
                              'userAnswer': selectedAnswers[i]
                            });
                            // FLog.info(text: '74: $resultSummary');
                            if (questionsAnswers[i].answers[0] == selectedAnswers[i]) {
                              // FLog.info(text: '78: $resultSummary, ${resultSummary.isEmpty}');
                              rightAnswers += 1;
                            }
                          }
                          widget.changeScreen('result', rightAnswers, resultSummary);
                        } else {
                          setState(() {
                            currentQuestionIndex++;
                          });
                        }
                      },
                    )),
          ],
        ),
      ),
    );
  }
}
