// //MAD TEST 2 SHORT QUESTION - 1819541

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Test 2 Short Question',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Test 2 Short Question'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Column(
//         children: [
//           Column(
//             children: [
//               Text("Question 1"),
//               for (int i = 0; i < 5; i++)
//                 Row(
//                   children: [
//                     for (int j = 0; j <= i; j++)
//                       Icon(
//                         Icons.star,
//                         color: j % 2 != 0 ? Colors.green : Colors.red,
//                       ),
//                   ],
//                 ),
//               Padding(padding: EdgeInsets.all(20)),
//               Text("Question 2"),
//               Container(
//                   child: Row(
//                 children: [
//                   Padding(padding: EdgeInsets.only(bottom: 10)),
//                   for (int k = 1; k < 4; k++)
//                     Column(
//                       children: [
//                         Column(
//                           children: [
//                             ElevatedButton(
//                               onPressed: () => print('Button'),
//                               child: Text('Row ' + k.toString() + ', Column 1'),
//                               style: ElevatedButton.styleFrom(
//                                   primary: Colors.blue,
//                                   shape: new RoundedRectangleBorder(
//                                       borderRadius:
//                                           new BorderRadius.circular(100.0)),
//                                   side: BorderSide(
//                                       width: 1.0, color: Colors.grey)),
//                             ),
//                             Padding(padding: EdgeInsets.all(10))
//                           ],
//                         ),
//                         Padding(padding: EdgeInsets.only(bottom: 10)),
//                         Column(
//                           children: [
//                             ElevatedButton(
//                               onPressed: () => print('Button'),
//                               child: Text('Row ' + k.toString() + ', Column 2'),
//                               style: ElevatedButton.styleFrom(
//                                   primary: Colors.blue,
//                                   shape: new RoundedRectangleBorder(
//                                       borderRadius:
//                                           new BorderRadius.circular(100.0)),
//                                   side: BorderSide(
//                                       width: 1.0, color: Colors.grey)),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                 ],
//               ))
//             ],
//           )
//         ],
//       ),

//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// //MAD TEST 2 LONG QUESTION - 1819541

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<PrayerTime> fetchPrayerTime(dateData) async {
  dateData.toString();
  print(dateData + 'dateData value');
  final response = await http.get(Uri.parse(
      'https://api.pray.zone/v2/times/month.json?city=mecca&month=' +
          dateData));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('SUCCESS');
    return PrayerTime.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print('FAIL');
    throw Exception('Failed to load prayer time');
  }
}

class PrayerTime {
  final String subh;
  final String zuhr;
  final String asr;
  final String maghr;
  final String isha;

  const PrayerTime({
    required this.subh,
    required this.zuhr,
    required this.asr,
    required this.maghr,
    required this.isha,
  });

  factory PrayerTime.fromJson(Map<String, dynamic> json) {
    return PrayerTime(
        subh: json['results']['datetime'][0]['times']['Fajr'],
        zuhr: json['results']['datetime'][0]['times']['Dhuhr'],
        asr: json['results']['datetime'][0]['times']['Asr'],
        maghr: json['results']['datetime'][0]['times']['Maghrib'],
        isha: json['results']['datetime'][0]['times']['Isha']);
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test 2 Long Question',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Test 2 Long Question'),
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
  late Future<PrayerTime> futurePrayer;
  String dateData = "2022-01";
  final myController = TextEditingController();

  void _getInput() {
    print(dateData + 'fetched');
    setState(() {
      dateData = myController.text.toString();
      print(dateData + ' afterfetched');
      futurePrayer = fetchPrayerTime(dateData);
    });
  }

  @override
  void initState() {
    super.initState();
    // dateData = myController.text;
    print(dateData + 'fetching');
    futurePrayer = fetchPrayerTime(dateData);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '2022-01',
                ),
              ),
              Text(
                  'Please input month that is less from 2022-01 since no data in API for months afterward'),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(onPressed: _getInput, child: Text('Submit Date')),
              Padding(padding: EdgeInsets.all(20)),
              Text('DATE : ' + dateData),
              Padding(padding: EdgeInsets.all(10)),
              FutureBuilder<PrayerTime>(
                  future: futurePrayer,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Text('Subuh : ' + snapshot.data!.subh),
                          Text('Zuhur : ' + snapshot.data!.zuhr),
                          Text('Asr : ' + snapshot.data!.asr),
                          Text('Maghrib : ' + snapshot.data!.maghr),
                          Text('Isha : ' + snapshot.data!.isha)
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return CircularProgressIndicator();
                    }

                    return CircularProgressIndicator();
                  }),
            ],
          ),
        )

        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
