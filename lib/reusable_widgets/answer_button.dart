
// import flutter pkgs
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answer,
    required this.nextQuestion,
  });

  final String answer;
  final void Function() nextQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: ElevatedButton(
        onPressed: nextQuestion,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo.shade900,
          shadowColor: Colors.indigoAccent.shade400,
          elevation: 2.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45),
          ),
          padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 25
          ),
        ),
        child: Text(
          answer,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ) ;
  }
}