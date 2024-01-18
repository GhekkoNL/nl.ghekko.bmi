import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bmi {
  Bmi({required this.height, required this.weight}) {
    // BMI formula using the Metric system.
    _bmi = weight / pow(height / 100, 2);
  }

  final int height;
  final int weight;
  late double _bmi;

  double get bmi => _bmi;

  String get bmiAsString => bmi.toStringAsFixed(2);

  String get wholeNumber {
    final indexOfDecimalPoint = bmiAsString.indexOf('.');

    return bmiAsString.substring(0, indexOfDecimalPoint);
  }

  String get decimalPart {
    final indexOfDecimalPoint = bmiAsString.indexOf('.');

    return bmiAsString.substring(indexOfDecimalPoint, indexOfDecimalPoint + 2);
  }

  String getInterpretationText(BuildContext context) {
    if (bmi >= 25) {
      return 'bmiToHigh'.tr;
    } else if (bmi >= 18.5) {
      return 'bmiNormal'.tr;
    }
    return 'bmiLow'.tr;
  }

  Color get interpretationColor {
    if (bmi >= 25) {
      return Colors.red;
    } else if (bmi > 18.5) {
      return Colors.green;
    }

    return Colors.orange;
  }

  @override
  String toString() => 'Bmi{height: $height, weight: $weight, bmi: $bmi, '
      'bmiAsString: $bmiAsString, wholeNumber: $wholeNumber, '
      'decimalPart: $decimalPart}';
}
