import 'dart:math';
class CalculaterBrain {
  CalculaterBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVER WEIGHT';
    }
    else if (_bmi >= 18.5) {
      return 'NORMAL';
    }
    else {
      return 'UNDER WEIGHT';
    }
  }

  String getinterpreter() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercies more';
    }
    else if (_bmi >= 18.5) {
      return 'You have a normal body weight Good job!!!';
    }
    else {
      return 'You have lower than normal body weight. Youn can eat a bit more';
    }
  }
}