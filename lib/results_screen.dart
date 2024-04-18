import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quizapp/models/questions_summary.dart';
import 'package:quizapp/question_screen.dart';
import 'package:quizapp/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAns});
  final List<String> chosenAns;
  List<Map<String, Object>> getsummarydata() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAns.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAns[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getsummarydata();
    final totalans = questions.length;
    final correectans = summarydata.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
              'You Answered $correectans out of $totalans questions correctly!'),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(getsummarydata()),
          const SizedBox(
            height: 30,
          ),
          TextButton(onPressed: () {}, child: const Text('restart'))
        ]),
      ),
    );
  }
}
