import 'package:recipe_finder/models/nutrient.dart';

class Food {
  final String foodId;
  final String label;
  final String category;
  final String? image;
  final Nutrient nutrients;

  Food({
    required this.foodId,
    required this.label,
    required this.category,
    required this.image,
    required this.nutrients,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      foodId: json['foodId'],
      label: json['label'],
      category: json['category'],
      image: json['image'],
      nutrients: Nutrient.fromJson(json['nutrients']),
    );
  }
}
