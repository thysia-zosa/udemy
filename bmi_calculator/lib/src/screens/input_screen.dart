import '../widgets/bmi_card.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  static const _footerTopMargin = 10.0;

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                BmiCard(),
                BmiCard(),
              ],
            ),
          ),
          BmiCard(),
          Expanded(
            child: Row(
              children: [
                BmiCard(),
                BmiCard(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: InputScreen._footerTopMargin,
            ),
            width: double.infinity,
            color: Colors.red.shade900,
            child: TextButton(
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
