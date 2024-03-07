// import flutter pkgs
import 'package:flutter/material.dart';

// import 3rd party pkgs
import 'package:google_fonts/google_fonts.dart';

// import project pkgs
import 'package:quiz_app/data/questions_answers.dart';
import 'package:quiz_app/models/quiz_model.dart';
import 'package:quiz_app/reusable_widgets/answer_button.dart';

// questions custom stateful widget
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.restartQuizOnEnd,
  });

  final void Function(String? changeScreen) restartQuizOnEnd;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  final List<String> selectedAnswers = [];

  @override
  Widget build(BuildContext context) {
    final QuizModel currentQuizQuestion = questionsAnswers[currentQuestionIndex];

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
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuizQuestion.getShuffledAnswers().map((answer) => AnswerButton(
                answer: answer,
                nextQuestion: () {
                  selectedAnswers.add(answer);
                  if (selectedAnswers.length == questionsAnswers.length) {
                    widget.restartQuizOnEnd('go');
                  } else {
                    setState(() {
                      currentQuestionIndex++;
                    });
                  }
                }
            )),
          ],
        ),
      ),
    );
  }

}