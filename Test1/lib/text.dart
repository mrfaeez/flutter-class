import 'package:flutter/material.dart';

import 'button.dart';

class RandomText extends StatelessWidget {
  final List<String> randomTextWord;
  final VoidCallback buttonPressed;
  final int textIndex;

  const RandomText(
      {Key? key,
      required this.randomTextWord,
      required this.buttonPressed,
      required this.textIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(randomTextWord.elementAt(textIndex)),
      Button(buttonPressed: buttonPressed)
    ]);
  }
}
