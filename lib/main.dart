
// import flutter pkgs
import 'package:flutter/material.dart';

// import project pkgs
import 'package:quiz_app/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
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
          child: const StartScreen(),
        )
      ),
    ),
  );
}