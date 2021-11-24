// Question 1

// import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('My First App'),
//         ),
//         body: Center(
//             child: Column(children: <Widget>[
//           Text('This is my default text!'),
//           Text('Additional text widget.'),
//           RaisedButton(
//             child: Text("Button"),
//             onPressed: () => print('pressed'),
//           )
//         ])),
//       ),
//     );
//   }
// }

// Question 2

// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('My First App'),
//         ),
//         body: Align(
//             alignment: Alignment.centerRight,
//             child: Column(children: <Widget>[
//               Text('This is my default text!'),
//               Text('Additional text widget.'),
//               RaisedButton(
//                 child: Text("Button"),
//                 onPressed: () => print('pressed'),
//               )
//             ])),
//       ),
//     );
//   }
// }

// Long Answer Programming

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import './text.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final randomText = const [
    'This is random text 1, hello',
    'This is random text 2, selamat pagi',
    'This is random text 3, Bonjour',
    'This is random text 4, sawadikap'
  ];

  var textIndex = 0;

  void buttonPressed() {
    setState(() {
      textIndex++;
      if (textIndex > 3) {
        textIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Long Answer Programming'),
        ),
        body: Center(
            child: Column(children: <Widget>[
          RandomText(
            randomTextWord: randomText,
            buttonPressed: buttonPressed,
            textIndex: textIndex,
          ),
        ])),
      ),
    );
  }
}
