import 'package:flutter/cupertino.dart';

class AnswerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AnswerButton(this.text, this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CupertinoButton(
        padding: const EdgeInsets.all(16),
        color: Color.fromARGB(255, 33, 1, 95),
        onPressed: onPressed,
        alignment: Alignment.centerLeft,
        child: Text(text,
            style: const TextStyle(color: CupertinoColors.white)),
      ),
    );
    // return ElevatedButton(
    //     style: ElevatedButton.styleFrom(
    //       backgroundColor: const Color.fromARGB(255, 33, 1, 95),
    //       foregroundColor: Colors.white,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(40),
    //       ),
    //     ),
    //     onPressed: onPressed,
    //     child: Text(text,textAlign: TextAlign.center,));
  }
}
