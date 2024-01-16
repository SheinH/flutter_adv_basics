import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/models/quiz_question.dart';
import 'package:adv_basics/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  List<String> selectedAnswers = [];

  QuizQuestion currentQuestion() => questions[currentQuestionIndex];

  List<AnswerButton> answerButtons() {
    final list = currentQuestion().answers.map((answer) {
      return AnswerButton(answer, () {
        setState(() {
          if (currentQuestion().answers[0] == answer) {
            correctAnswers++;
          }
          selectedAnswers.add(answer);
          currentQuestionIndex++;
        });
      });
    }).toList();
    list.shuffle();
    return list;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(currentQuestion().text, style: TextStyle(color: Colors.white)),
          const SizedBox(height: 30),
          ...answerButtons()
        ],
      ),
    );
  }
}
