import 'package:adv_basics/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartingScreen extends StatelessWidget {

  final void Function() startQuiz;
  const StartingScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/quiz-logo.png',
            width: 300, color: const Color.fromARGB(150, 255, 255, 255)),
        const SizedBox(height: 20),
        const Text("Learn Flutter the fun way!",
            style: TextStyle(color: Colors.white, fontSize: 24)),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: const Icon(CupertinoIcons.arrow_right),
          label:
              const Text('Start Quiz', style: TextStyle(color: Colors.white)),
        )
      ],
    );
  }


}
