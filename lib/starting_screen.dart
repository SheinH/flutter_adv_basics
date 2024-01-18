import 'package:flutter/cupertino.dart';

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
            style: TextStyle(color: CupertinoColors.white, fontSize: 24)),
        const SizedBox(height: 20),
        CupertinoButton(
          color: CupertinoColors.white.withAlpha(100),
          onPressed: startQuiz,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(CupertinoIcons.arrow_right),
              SizedBox(width: 10),
              Text('Start Quiz'),
            ],
          )
          // child: const Text('Start Quiz'),
        ),
        // OutlinedButton.icon(
        //   onPressed: startQuiz,
        //   style: OutlinedButton.styleFrom(
        //     foregroundColor: Colors.white,
        //   ),
        //   icon: const Icon(CupertinoIcons.arrow_right),
        //   label:
        //       const Text('Start Quiz', style: TextStyle(color: Colors.white)),
        // )
      ],
    );
  }


}
