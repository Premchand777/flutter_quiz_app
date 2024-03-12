// import flutter pkgs
import 'package:flutter/material.dart';

// import 3rd party pkgs
import 'package:google_fonts/google_fonts.dart';

class IconTextActionButton extends StatelessWidget {
  const IconTextActionButton({
    super.key,
    required this.icon,
    required this.text,
    required this.initStartRestart,
  });

  final IconData icon;
  final String text;
  final void Function() initStartRestart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: ElevatedButton.icon(
        onPressed: initStartRestart,
        // () {
        //   changeScreen('questions', null);
        // },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo.shade900,
          shadowColor: Colors.indigoAccent,
        ),
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        label: Text(
          text,
          style: GoogleFonts.rubik(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1,
            wordSpacing: 1,
          ),
        ),
      ),
    );
  }
}
