import 'package:bmi_calculator/src/screens/result_screen.dart';
import 'package:flutter/material.dart';

import '../consts.dart';
import '../models/bmi_person.dart';
import '../models/gender.dart';
import '../widgets/bmi_app_bar.dart';
import '../widgets/bmi_bottom_button.dart';
import '../widgets/bmi_card.dart';
import '../widgets/bmi_icon_button.dart';
import '../widgets/bmi_icon_card.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  BmiPerson person = BmiPerson();
  void _calculate() {
    if (person.gender == null) {
      _noGenderAlert();
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          bmiResult: person.getResult(),
        ),
      ),
    );
  }

  // TODO: adapt design
  Future<void> _noGenderAlert() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('No gender set'),
          content: const Center(
            child: Text('You have to chose a gender.'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BmiAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                const SizedBox(
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

  BmiCard _sliderCard() {
    return BmiCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'height'.toUpperCase(),
            style: Texts.label,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                person.height.toStringAsFixed(0),
                style: Texts.big,
              ),
              const Text(
                'cm',
                style: Texts.label,
              ),
            ],
          ),
          Slider(
            value: person.height,
            onChanged: (double value) {
              setState(() {
                person.height = value;
              });
            },
            min: 120.0,
            max: 250.0,
          ),
        ],
      ),
    );
  }

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
