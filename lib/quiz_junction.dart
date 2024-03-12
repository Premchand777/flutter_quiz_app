// import flutter pkgs
import 'package:flutter/material.dart';

// import project pkgs
import 'package:flutter_quiz/quiz_start_screen.dart';
import 'package:flutter_quiz/questions_screen.dart';
import 'package:flutter_quiz/result_screen.dart';

// Start quiz screen custom stateful widget
class QuizJunction extends StatefulWidget {
  const QuizJunction({super.key});

  @override
  State<QuizJunction> createState() => _QuizJunctionState();
}

class _QuizJunctionState extends State<QuizJunction> {
  String activeScreen = 'quizStart';
  int? correctAnswers;
  List<Map<String, dynamic>>? resultSummary;

  void switchScreen(
    String screenName,
    int? correctAnswers,
    List<Map<String, dynamic>>? resultSummary,
  ) {
    if (resultSummary?.isNotEmpty == true) {
      this.resultSummary = resultSummary;
      this.correctAnswers = correctAnswers;
    }

    setState(() {
      activeScreen = screenName;
    });
  }

  // @override
  // void initState() {
  //   activeScreen = QuizStartScreen(switchScreen);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = Container();
    if (activeScreen == 'quizStart') {
      currentScreen = QuizStartScreen(changeScreen: switchScreen);
    }

    if (activeScreen == 'questions') {
      currentScreen = QuestionsScreen(changeScreen: switchScreen);
    }

    if (activeScreen == 'result') {
      currentScreen = ResultScreen(
        changeScreen: switchScreen,
        rightAnswers: correctAnswers,
        resultSummary: resultSummary as List<Map<String, dynamic>>,
      );
    }

    return MaterialApp(
      title: 'Flutter Quiz',
      home: Scaffold(
        // backgroundColor: Colors.indigo,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.indigo,
                Colors.indigo.shade700,
              ],
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
