import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_fitness_app/models/foods_model.dart';

class FoodsServices {
  Future<List<FoodsModel>> loadFoods() async {
    final String jsonString = await rootBundle.loadString('assets/foods.json');
    final List jsonList = jsonDecode(jsonString);
    return jsonList.map((e) => FoodsModel.fromJson(e)).toList();
  }
}
