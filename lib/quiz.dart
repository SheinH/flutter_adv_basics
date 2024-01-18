import 'package:adv_basics/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/starting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return QuizState();
  }
}

enum QuizScreen { start, questions, results }

class QuizState extends State<Quiz> {
  // late Widget currentScreen;
  QuizScreen currentScreen = QuizScreen.start;
  final List<String> answers = [];

  QuizState();

  void startQuiz() {
    print("Quiz started!");
    setState(() {
      currentScreen = QuizScreen.questions;
    });
  }

  void answerQuestion(String answer) {
    answers.add(answer);
    if (answers.length == questions.length) {
      setState(() {
        currentScreen = QuizScreen.results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Container(
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
          // child: currentScreen == QuizScreen.start
          //     ? StartingScreen(startQuiz)
          //     : QuestionsScreen(answerQuestion),
          child: getCurrentScreen(),
        ),
      ),
    );
  }

  getCurrentScreen() {
    switch (currentScreen) {
      case QuizScreen.start:
        return StartingScreen(startQuiz);
      case QuizScreen.questions:
        return QuestionsScreen(answerQuestion);
      case QuizScreen.results:
        return ResultsScreen(
            answers,
            () => setState(() {
                  currentScreen = QuizScreen.start;
                  answers.clear();
                }));
    }
  }
}
