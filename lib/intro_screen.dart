import 'package:flutter/material.dart';
import 'package:quizapp/styledtext.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/quiz-logo.png',
            width: 250,
            color: Color.fromARGB(166, 255, 255, 255),
          ),
          const SizedBox(height: 60),
          const StyledText(text: 'Learn Flutter the fun way!'),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: Icon(Icons.arrow_right_alt),
            label: Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
