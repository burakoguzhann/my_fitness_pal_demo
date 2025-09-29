import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/models/stats_model.dart';

class StatsProvider extends ChangeNotifier {
  StatsModel? _userData; // Provider'ın field'ı
  StatsModel? get userData => _userData; // Dışarıdan erişim için getter

  void bilgileriTut(StatsModel stats) {
    _userData = StatsModel(
      age: stats.age,
      height: stats.height,
      weight: stats.weight,
    );
    notifyListeners();
  }
}
