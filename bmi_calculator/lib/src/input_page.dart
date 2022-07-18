import 'package:bmi_calculator/src/bmi_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputPage extends StatelessWidget {
  const InputPage({Key? key}) : super(key: key);

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
