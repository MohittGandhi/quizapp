import 'package:flutter/material.dart';
import 'package:quizapp/intro_screen.dart';
import 'package:quizapp/question_screen.dart';

// YOU CAN STIRE WIDGET IN VARIABLE
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

// we have 2 widget that need to work on same state
// lift the state
// agar screen render karna hai completely to pehle ek widget declare karna hoga
// aur us screen ki render karke widget declare kara hai usme dalna hoga
//
class _QuizState extends State<Quiz> {
  var activeScreen = 'intro-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = IntroScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = const QuestionsScreen();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 15, 118, 228),
              Color.fromARGB(255, 40, 20, 169)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: activeScreen == 'intro-screen' //condition
            ? IntroScreen(switchScreen) //value used if true
            : const QuestionsScreen(), // value used if false
      )),
    );
  }
}
//+917004209320
