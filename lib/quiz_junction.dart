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
  String activeScreen = 'quizStart';

  void switchScreen(String? changeScreen) {
    setState(() {
      activeScreen = changeScreen?.isNotEmpty == true ?'quizStart' : 'questions';
    });
  }

  // @override
  // void initState() {
  //   activeScreen = QuizStartScreen(switchScreen);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = QuizStartScreen(switchScreen);

    if (activeScreen == 'questions') {
      currentScreen = QuestionsScreen(restartQuizOnEnd: switchScreen);
    }

    return MaterialApp(
      title: 'quiz_app',
      home: Scaffold(
        // backgroundColor: Colors.indigo,
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.indigo,
                    Colors.indigo.shade700
                  ]
              ),
            ),
            child: currentScreen,
          ),
      ),
    );
  }
}