import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red[900],
            title: const Text('I am Poor'),
          ),
          body: Center(
            child: Image.asset('images/'),
          )),
    ),
  );
}
