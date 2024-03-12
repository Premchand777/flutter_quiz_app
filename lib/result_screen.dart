// import flutter pkgs
import 'package:flutter/material.dart';

// import 3rd party pkgs

// import project pkgs
import 'package:flutter_quiz/reusable_widgets/icon_text_action_button.dart';

// result screen stateless widget
class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
    this.rightAnswers,
    required this.resultSummary,
    required this.changeScreen,
  });

  final int? rightAnswers;
  final List<Map<String, dynamic>> resultSummary;
  final void Function(
    String screenName,
    int? rightAnswers,
    List<Map<String, dynamic>>? resultSummary,
  ) changeScreen;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'You have answered ${widget.rightAnswers} out of ${widget.resultSummary.length} questions correctly!',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(233, 255, 255, 255),
              letterSpacing: 1,
              wordSpacing: 1,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 450,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: widget.resultSummary.map((result) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                backgroundColor: result['correctAnswer'].toString() == result['userAnswer'].toString()
                                    ? const Color.fromARGB(255, 102, 232, 93)
                                    : const Color.fromARGB(255, 238, 117, 141),
                                padding: const EdgeInsets.all(0),
                                // shape
                                shape: const CircleBorder(side: BorderSide.none)),
                            child: Text(
                              result['questionNo'].toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(26, 35, 126, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromRGBO(26, 35, 126, 1),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                result['question'].toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1,
                                  wordSpacing: 1,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                'System: ${result['correctAnswer'].toString()}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255, 102, 232, 93),
                                  letterSpacing: 1,
                                  wordSpacing: 1,
                                ),
                              ),
                              const SizedBox(
                                height: 1.5,
                              ),
                              Text(
                                'You: ${result['userAnswer'].toString()}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: result['correctAnswer'].toString() == result['userAnswer'].toString()
                                      ? const Color.fromARGB(255, 102, 232, 93)
                                      : const Color.fromARGB(255, 238, 117, 141),
                                  letterSpacing: 1,
                                  wordSpacing: 1,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          IconTextActionButton(
            icon: Icons.restart_alt_rounded,
            text: 'Restart Quiz',
            initStartRestart: () {
              widget.changeScreen(
                'quizStart',
                null,
                null,
              );
            },
          ),
        ],
      ),
    );
  }
}
