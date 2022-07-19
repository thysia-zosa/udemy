import '../widgets/bmi_card.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  static const _footerTopMargin = 10.0;

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
              top: _footerTopMargin,
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
