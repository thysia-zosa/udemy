import 'package:bmi_calculator/src/consts.dart';
import 'package:flutter/material.dart';

import 'screens/input_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI calculator',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: Cols.darkPurple),
        primaryColor: Cols.darkPurple,
        scaffoldBackgroundColor: Cols.darkPurple,
      ),
      home: InputScreen(),
    );
  }
}
