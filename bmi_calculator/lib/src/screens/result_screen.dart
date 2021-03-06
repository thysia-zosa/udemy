import 'package:bmi_calculator/src/models/bmi_result.dart';
import 'package:flutter/material.dart';

import '../consts.dart';
import '../widgets/bmi_app_bar.dart';
import '../widgets/bmi_bottom_button.dart';
import '../widgets/bmi_card.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.bmiResult,
  }) : super(key: key);

  final BmiResult bmiResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BmiAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Your Result',
                style: Texts.big,
              ),
            ),
          ),
          _resultCard(),
          BmiBottomButton(
            text: 're-calculate',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  BmiCard _resultCard() {
    return BmiCard(
      flex: 5,
      horizontalPadding: 15.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            bmiResult.title.toUpperCase(),
            style: Texts.result,
          ),
          Text(
            bmiResult.bmi,
            style: Texts.veryBig,
          ),
          Text(
            bmiResult.explanation,
            style: Texts.body,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
