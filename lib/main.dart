// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      // ignore: avoid_unnecessary_containers
      home: Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('Calculator',
              style: TextStyle(
                color: Colors.white,
              )),
        ),

        // body: MyHomePage(),
        body: Calculator(),
      ),
    );
  }
}
