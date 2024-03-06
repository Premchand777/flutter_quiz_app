// import flutter pkgs
import 'package:flutter/material.dart';

// questions custom stateful widget
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'What is Flutter?',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ],
    );
  }
}