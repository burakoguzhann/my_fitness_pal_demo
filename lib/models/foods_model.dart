class FoodsModel {
  final String name;
  final double calories;
  final double protein;
  final double fat;
  final double carbs;

  FoodsModel({
    required this.name,
    required this.calories,
    required this.carbs,
    required this.fat,
    required this.protein,
  });

  factory FoodsModel.fromJson(Map<String, dynamic> json) {
    return FoodsModel(
      name: json['name'] ?? '',
      calories: (json['calories'] as num).toDouble(),
      carbs: (json['carbs'] as num).toDouble(),
      fat: (json['fat'] as num).toDouble(),
      protein: (json['protein'] as num).toDouble(),
    );
  }
}
