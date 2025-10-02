import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/models/foods_model.dart';
import 'package:flutter_fitness_app/services/foods_services.dart';

class FoodsProvider extends ChangeNotifier {
  final _foodService = FoodsServices();
  List<FoodsModel> _modelList = [];
  List<FoodsModel> _allfoodList = [];
  List<FoodsModel> get FoodsModelList => _modelList;
  List<FoodsModel> get AllModelList => _allfoodList;

  // Tüm besinleri çekmek için
  Future<void> getAllFoods() async {
    _allfoodList = await _foodService.loadFoods();
    _modelList = List.from(_allfoodList); // Bunu ekle!
    notifyListeners();
  }

  // Search kısmı için
  void getSearchFoods(String data) {
    if (data.isEmpty) {
      _modelList = _allfoodList;
      notifyListeners();
    } else {
      final results = _allfoodList
          .where(
            (element) =>
                element.name.toLowerCase().contains(data.toLowerCase()),
          )
          .toList();
      _modelList = results;
      notifyListeners();
    }
  }
}
