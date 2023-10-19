import 'food.dart';
import 'measure.dart';

class Recipe {
  final Food food;
  final List<Measure> measures;

  Recipe({required this.food, required this.measures});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    final measuresJson = (json['measures'] as List ?? []).map(
      (e) => Measure.fromJson(e),
    );

    return Recipe(
      food: Food.fromJson(json['food']),
      measures: measuresJson.toList(),
    );
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((e) => Recipe.fromJson(e)).toList();
  }
}
