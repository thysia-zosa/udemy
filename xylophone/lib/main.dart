import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  XylophoneApp({Key? key}) : super(key: key);

  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  Widget buildKey({
    required Color color,
    required int soundNum,
  }) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {},
        child: const Text(''),
      ),
    );
  }

  List<Widget> rowBuilder() {
    List<Widget> list = [];
    for (var i = 0; i < colors.length; i++) {
      list.add(buildKey(color: colors[i], soundNum: i));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Row(
            children: rowBuilder(),
          ),
        ),
      ),
    );
  }
}
