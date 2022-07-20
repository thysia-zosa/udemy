import 'package:bmi_calculator/src/consts.dart';
import 'package:bmi_calculator/src/models/gender.dart';
import 'package:bmi_calculator/src/widgets/bmi_bottom_button.dart';
import 'package:bmi_calculator/src/widgets/bmi_icon_button.dart';
import 'package:bmi_calculator/src/widgets/bmi_icon_card.dart';

import '../models/bmi_person.dart';
import '../widgets/bmi_card.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  BmiPerson person = BmiPerson();
  void _calculate() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI calculator'.toUpperCase(),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                _maleCard(),
                _femaleCard(),
              ],
            ),
          ),
          _sliderCard(),
          Expanded(
            child: Row(
              children: [
                _weightCard(),
                _ageCard(),
              ],
            ),
          ),
          BmiBottomButton(
            text: 'calculate'.toUpperCase(),
            onPressed: _calculate,
          ),
        ],
      ),
    );
  }

  BmiCard _twoButtonCard(
    String title,
    int value,
    int minValue,
    int maxValue,
    VoidCallback add,
    VoidCallback subtract,
  ) =>
      BmiCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title.toUpperCase(),
              style: Texts.label,
            ),
            Text(
              value.toString(),
              style: Texts.big,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BmiIconButton(
                  icon: Ikons.minus,
                  onPressed: () {
                    setState(() {
                      subtract();
                    });
                  },
                  enabled: value > minValue,
                ),
                SizedBox(
                  width: 15.0,
                ),
                BmiIconButton(
                  icon: Ikons.plus,
                  onPressed: () {
                    setState(() {
                      add();
                    });
                  },
                  enabled: value < maxValue,
                ),
              ],
            )
          ],
        ),
      );

  BmiCard _ageCard() => _twoButtonCard(
        'age',
        person.age,
        0,
        130,
        () => person.age++,
        () => person.age--,
      );

  BmiCard _weightCard() => _twoButtonCard(
        'weight',
        person.weight,
        20,
        200,
        () => person.weight++,
        () => person.weight--,
      );

  BmiCard _sliderCard() => BmiCard();

  BmiCard _genderCard(
    Gender gender,
    String title,
    IconData icon,
  ) {
    return BmiCard(
      color: person.gender == gender ? Cols.lightPurple : Cols.purple,
      onPressed: () {
        setState(() {
          person.gender = gender;
        });
      },
      child: IconCard(
        icon: icon,
        text: title.toUpperCase(),
      ),
    );
  }

  BmiCard _femaleCard() => _genderCard(Gender.female, 'female', Ikons.female);

  BmiCard _maleCard() => _genderCard(Gender.male, 'male', Ikons.male);
}
