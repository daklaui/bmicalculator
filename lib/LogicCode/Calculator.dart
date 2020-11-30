import 'dart:math';

class Calculator {
  Calculator({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculeBmi() {
    double bmi = weight / pow(height / 100, 2);
    _bmi = bmi.toDouble();
    return _bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getTips() {
    if (_bmi >= 25) {
      return 'You have a higher weight that the normal, Do some sport';
    } else if (_bmi > 18.5) {
      return 'You have a normal weight, Keep going';
    } else {
      return 'You have a lower weight than the normal, You have to eat more';
    }
  }
}
