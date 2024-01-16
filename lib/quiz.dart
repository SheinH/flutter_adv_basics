import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/starting_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return QuizState();
  }
}

enum QuizScreen { start, questions }

class QuizState extends State<Quiz> {
  // late Widget currentScreen;
  QuizScreen currentScreen = QuizScreen.start;

  // @override
  // void initState() {
  //   super.initState();
  //   currentScreen = StartingScreen(startQuiz);
  // }

  QuizState();

  void startQuiz() {
    print("Quiz started!");
    setState(() {
      currentScreen = QuizScreen.questions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.deepPurpleAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
              child: currentScreen == QuizScreen.start
                  ? StartingScreen(startQuiz)
                  : const QuestionsScreen()),
        ),
      ),
    );
  }
}
