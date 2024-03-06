// import flutter pkgs
import 'package:flutter/material.dart';

// import project pkgs
import 'package:quiz_app/quiz_start_screen.dart';
import 'package:quiz_app/questions_screen.dart';

// Start quiz screen custom stateful widget
class QuizJunction extends StatefulWidget {
  const QuizJunction({super.key});

  @override
  State<QuizJunction> createState() => _QuizJunctionState();
}

class _QuizJunctionState extends State<QuizJunction> {
  String activeScreen = 'quiz-start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  // @override
  // void initState() {
  //   activeScreen = QuizStartScreen(switchScreen);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'quiz_app',
      home: Scaffold(
        // backgroundColor: Colors.indigo,
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.indigo.shade700,
                    Colors.indigo.shade900
                  ]
              ),
            ),
            child: activeScreen == 'quiz-start-screen'
                ? QuizStartScreen(switchScreen)
                : const QuestionsScreen(),
          ),
      ),
    );
  }
}