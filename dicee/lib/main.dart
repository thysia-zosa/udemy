import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: const Center(
          child: DiceRow(
            dices: 2,
          ),
        ),
      ),
    );
  }
}

class DiceRow extends StatefulWidget {
  final int dices;

  const DiceRow({
    Key? key,
    required this.dices,
  }) : super(key: key);
  @override
  State<DiceRow> createState() => _DiceRowState();
}

class _DiceRowState extends State<DiceRow> {
  late List<int> _diceNumbers;

  _DiceRowState() {
    _diceNumbers = List.filled(widget.dices, 1);
  }

  void _castDices() {
    setState(() {
      for (int i = 0; i < widget.dices; i++) {
        _diceNumbers[i] = Random().nextInt(6) + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(
        widget.dices,
        (index) => Expanded(
          child: TextButton(
            onPressed: _castDices,
            child: Image.asset('images/dice${_diceNumbers[index]}.png'),
          ),
        ),
      ),
    );
  }
}
