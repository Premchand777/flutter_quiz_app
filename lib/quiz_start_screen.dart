
// import flutter pkgs
import 'package:flutter/material.dart';

// import 3rd party pkgs
import 'package:google_fonts/google_fonts.dart';

// start screen stateless custom widget
class QuizStartScreen extends StatelessWidget {
  const QuizStartScreen(this.switchScreen, { super.key });

  final void Function(String? changeScreen) switchScreen;

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
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            onPressed: () {
              switchScreen(null);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo.shade900,
              shadowColor: Colors.indigoAccent,
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            label: Text(
              'Start Quiz',
              style: GoogleFonts.rubik(
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