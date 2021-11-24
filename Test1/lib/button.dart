import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback buttonPressed;

  const Button({
    Key? key,
    required this.buttonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RaisedButton(
        child: Text("Change Text"),
        onPressed: buttonPressed,
      )
    ]);
  }
}
