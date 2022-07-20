import 'package:bmi_calculator/src/consts.dart';
import 'package:bmi_calculator/src/screens/result_screen.dart';
import 'package:flutter/material.dart';

import 'screens/input_screen.dart';

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI calculator',
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Cols.darkPurple,
        ),
        primaryColor: Cols.darkPurple,
        scaffoldBackgroundColor: Cols.darkPurple,
        sliderTheme: const SliderThemeData(
          overlayColor: Cols.wine,
          activeTrackColor: Cols.white,
          inactiveTrackColor: Cols.lightGrey,
          thumbColor: Cols.red,
        ),
      ),
      // home: const InputScreen(),
      home: const ResultScreen(),
    );
  }
}
