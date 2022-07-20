import 'package:flutter/material.dart';

import '../consts.dart';
import '../widgets/bmi_app_bar.dart';
import '../widgets/bmi_bottom_button.dart';
import '../widgets/bmi_card.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BmiAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Your Result',
                style: Texts.big,
              ),
            ),
          ),
          BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'a',
                    style: Texts.result,
                  ),
                  Text(
                    'b',
                    style: Texts.veryBig,
                  ),
                  Text(
                    'c',
                    style: Texts.body,
                  ),
                ],
              ),
              flex: 5),
          BmiBottomButton(
            text: 're-calculate',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
