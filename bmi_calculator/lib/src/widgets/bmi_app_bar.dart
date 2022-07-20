import 'package:flutter/material.dart';

class BmiAppBar extends AppBar {
  BmiAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BmiAppBar> createState() => _BmiAppBarState();
}

class _BmiAppBarState extends State<BmiAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'BMI calculator'.toUpperCase(),
      ),
      centerTitle: true,
    );
  }
}
