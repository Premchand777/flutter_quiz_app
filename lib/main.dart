
// import flutter pkgs
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'quiz_app',
      home: Scaffold(
        backgroundColor: Colors.indigo,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.indigo.shade700),
                  shadowColor: const MaterialStatePropertyAll(Colors.grey),
                ),
                child: const Text(
                  'Start Quiz',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}