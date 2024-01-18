import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/models/quiz_question.dart';
import 'package:adv_basics/questions.dart';
import 'package:flutter/cupertino.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen(this.answerQuestion, {Key? key}) : super(key: key);
  Function(String) answerQuestion;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  QuizQuestion currentQuestion() => questions[currentQuestionIndex];

  List<AnswerButton> answerButtons() {
    final list = currentQuestion().answers.map((answer) {
      return AnswerButton(answer, () {
        widget.answerQuestion(answer);
        if (currentQuestionIndex < questions.length - 1) {
          setState(() {
            currentQuestionIndex++;
          });
        }
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
          Text(currentQuestion().text, style: const TextStyle(color: CupertinoColors.white)),
          const SizedBox(height: 30),
          ...answerButtons()
        ],
      ),
    );
  }
}
