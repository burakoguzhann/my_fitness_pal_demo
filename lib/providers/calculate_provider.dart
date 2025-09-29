import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/models/caloricalculator_model.dart';

class CalculateProvider extends ChangeNotifier {
  double _toplam = 0;
  double get toplam => _toplam;

  bool _isMale = true;
  bool get isMale => _isMale;

  double toCalculate(CaloriCalculatorModel model) {
    if (model.male == true) {
      _toplam =
          66 + (13.7 * model.weight) + (5 * model.height) - (6.8 * model.age);
    } else {
      _toplam =
          655 + (9.6 * model.weight) + (1.8 * model.height) - (4.7 * model.age);
    }
    notifyListeners();
    print(_toplam);
    return _toplam;
  }

  void setGender(bool value) {
    _isMale = value;
    notifyListeners();
  }
}
