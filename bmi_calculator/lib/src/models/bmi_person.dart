import 'bmi_result.dart';
import 'gender.dart';

List<BmiResult> _results = [
  BmiResult(
    18.0,
    19.0,
    'Underweight'.toUpperCase(),
    'You have a higher than normal body weight. Try to exercise more.',
  ),
  BmiResult(
    25.0,
    26.0,
    'Normal weight'.toUpperCase(),
    'You have a normal body weight. Good job!',
  ),
  BmiResult(
    double.infinity,
    double.infinity,
    'Overweight'.toUpperCase(),
    'You have a lower than normal body weight. You can eat a bit more.',
  ),
];

class BmiPerson {
  double height;
  int weight;
  int age;
  Gender? gender;

  BmiPerson({
    this.height = 180,
    this.weight = 70,
    this.age = 25,
  });

  double _calculateBmi() {
    return 10000 * weight / (height * height);
  }

  BmiResult getResult() {
    if (gender == null) throw Exception('Gender is null');
    double bmi = _calculateBmi();
    return _results.firstWhere((element) =>
        (gender == Gender.male
            ? element.upperMaleConstraint
            : element.upperFemaleConstraint) >
        bmi)
      ..bmi = bmi.toStringAsFixed(1);
  }
}
