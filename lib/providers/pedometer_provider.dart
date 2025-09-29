import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

class StepCounterProvider with ChangeNotifier {
  int _steps = 0;         // Gösterilecek adım
  int? _baseline;         // İlk okunan değer
  late Stream<StepCount> _stepCountStream;

  int get steps => _steps;

  StepCounterProvider() {
    _initPedometer();
  }

  void _initPedometer() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(_onStepCount).onError(_onStepError);
  }

  void _onStepCount(StepCount event) {
    if (_baseline == null) {
      _baseline = event.steps; 
    }
    _steps = event.steps - _baseline!;
    notifyListeners();
  }

  void _onStepError(error) {
    debugPrint("Adım sensörü hatası: $error");
  }
}
