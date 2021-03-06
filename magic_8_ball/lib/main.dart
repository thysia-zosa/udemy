import 'dart:math';

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
      home: Scaffold(
        backgroundColor: Colors.blue.shade300,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: const Text(
            'Ask me anything',
            style: TextStyle(
              fontSize: 40.0,
            ),
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _choice = 0;

  void _getAnswer() {
    setState(() {
      _choice = Random().nextInt(5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _getAnswer,
      child: Image.asset('images/ball$_choice.png'),
    );
  }
}
