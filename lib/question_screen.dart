import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';
import 'package:quizapp/models/quiz_questions.dart';
import 'package:quizapp/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() => _QuesstionsScreenState();
}

class _QuesstionsScreenState extends State<QuestionsScreen> {
  var currentquestion = 0;
  void answerquestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentquestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final CurrentQuestions = questions[currentquestion];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(CurrentQuestions.text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
            ),
            const SizedBox(
              height: 30,
            ), //iterable error solved by adding 3 dots
            ...CurrentQuestions.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerquestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
