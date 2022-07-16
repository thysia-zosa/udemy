import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: const Center(
          child: DicePage(
            diceCount: 2,
          ),
        ),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key, required this.diceCount}) : super(key: key);
  final int diceCount;

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  List<int>? diceNumbers;

  void changeDiceFace() {
    setState(() {
      for (int i = 0; i < widget.diceCount; i++) {
        diceNumbers![i] = Random().nextInt(6) + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    diceNumbers ??= List<int>.filled(widget.diceCount, 1);
    List<Widget> rowElements = [];
    for (int i = 0; i < widget.diceCount; i++) {
      rowElements.add(
        Expanded(
          child: TextButton(
            onPressed: changeDiceFace,
            child: Image.asset(
              'images/dice${diceNumbers![i]}.png',
            ),
          ),
        ),
      );
    }
    return Row(
      children: rowElements,
    );
  }
}
