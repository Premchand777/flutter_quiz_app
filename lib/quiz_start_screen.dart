
// import flutter pkgs
import 'package:flutter/material.dart';

// start screen stateless custom widget
class QuizStartScreen extends StatelessWidget {
  const QuizStartScreen(this.switchScreen, { super.key });

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'lib/assets/images/quiz-logo.png',
            width: 250,
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Learn the Flutter the fun way!',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            onPressed: switchScreen,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              shadowColor: Colors.indigoAccent,
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }
}