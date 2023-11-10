import 'dart:math';

class calculatorbrain {
  calculatorbrain({
    this.height,
    this.weight,
  });
  final int? height;
  final int? weight;
  double bmi = 0;
  String brain() {
    bmi = weight! / pow(height! / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String result_() {
    if (bmi >= 25) {
      return 'overweight';
    } else if (bmi > 18.5) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  String message_() {
    if (bmi >= 25) {
      return 'you have higher than normal body weight try to excercise wait';
    } else if (bmi > 18.5) {
      return 'you are fit keep it up';
    } else {
      return 'you have lower weight than normal body weight try to gain weight';
    }
  }
}
