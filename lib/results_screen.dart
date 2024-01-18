import 'package:adv_basics/questions.dart';
import 'package:flutter/cupertino.dart';

class ResultsScreen extends StatelessWidget {
  List<String> answers;
  int score = 0;

  var restartCallback;
  ResultsScreen(this.answers,this.restartCallback, {super.key}) {
    for (var i = 0; i < answers.length; i++) {
      if (answers[i] == questions[i].answers[0]) {
        score++;
      }
    }
  }

  Widget generateResultWidget(
      int num, String question, String answer, String correctAnswer) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: answer == correctAnswer
                  ? Color(0xff81c6f8)
                  : Color(0xffff74f7),
              shape: BoxShape.circle,
            ),
            child:  Center(
              child: Text(
                num.toString(),
                style: const TextStyle(
                  color: CupertinoColors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question,
                  style: const TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 16,
                  ),
                ),
                Text(answer,
                    style: TextStyle(color: CupertinoColors.white.withAlpha(128))),
                Text(correctAnswer,
                    style: const TextStyle(color: CupertinoColors.activeGreen)),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "You answered $score out of ${questions.length} questions correctly!",
              style: const TextStyle(
                color: CupertinoColors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // ListView(
            //   children: [
            //   ],
            // ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  for (var i = 0; i < questions.length; i++)
                    generateResultWidget(i + 1, questions[i].text, answers[i],
                        questions[i].answers[0])
                ],
              ),
            ),
            SizedBox(height: 20),
            CupertinoButton(
                color: CupertinoColors.white.withAlpha(100),
                onPressed: restartCallback,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(CupertinoIcons.refresh),
                    SizedBox(width: 10),
                    Text('Restart Quiz'),
                  ],
                )
              // child: const Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
