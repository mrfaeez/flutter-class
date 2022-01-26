//MAD TEST 2 SHORT QUESTION - 1819541

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test 2 Short Question',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Test 2 Short Question'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Text("Question 1"),
              for (int i = 0; i < 5; i++)
                Row(
                  children: [
                    for (int j = 0; j <= i; j++)
                      Icon(
                        Icons.star,
                        color: j % 2 != 0 ? Colors.green : Colors.red,
                      ),
                  ],
                ),
              Padding(padding: EdgeInsets.all(20)),
              Text("Question 2"),
              Container(
                  child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  for (int k = 1; k < 4; k++)
                    Column(
                      children: [
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () => print('Button'),
                              child: Text('Row ' + k.toString() + ', Column 1'),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(100.0)),
                                  side: BorderSide(
                                      width: 1.0, color: Colors.grey)),
                            ),
                            Padding(padding: EdgeInsets.all(10))
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () => print('Button'),
                              child: Text('Row ' + k.toString() + ', Column 2'),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(100.0)),
                                  side: BorderSide(
                                      width: 1.0, color: Colors.grey)),
                            ),
                          ],
                        )
                      ],
                    ),
                ],
              ))
            ],
          )
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
