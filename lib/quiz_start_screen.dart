// import flutter pkgs
import 'package:flutter/material.dart';

// import 3rd party pkgs
import 'package:google_fonts/google_fonts.dart';

// import project pkgs
import 'package:flutter_quiz/reusable_widgets/icon_text_action_button.dart';

// start screen stateless custom widget
class QuizStartScreen extends StatelessWidget {
  const QuizStartScreen({super.key, required this.changeScreen});

  final void Function(
    String screenName,
    int? correctAnswers,
    List<Map<String, dynamic>>? resultSummary,
  ) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'lib/assets/images/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(180, 255, 255, 255),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Learn the Flutter the fun way!',
            style: GoogleFonts.rubik(
              fontWeight: FontWeight.normal,
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 1,
              wordSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          IconTextActionButton(
            icon: Icons.arrow_right_alt,
            text: 'Start Quiz',
            initStartRestart: () {
              changeScreen('questions', null, null);
            },
          ),
        ],
      ),
    );
  }
}
