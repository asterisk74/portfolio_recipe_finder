import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import 'ingredient.dart';

class RecipeEntity extends Equatable {
  final int id;
  final String title;
  final String? summary;
  final String? instructions;
  @ignore
  final List<String>? dishTypes;
  final String? image;
  final String? imageType;
  final int? servings;
  final int? readyInMinutes;
  final double? spoontacularScore;
  final double? healthScore;
  @ignore
  final List<IngredientEntity>? extendedIngredients;

  const RecipeEntity({
    required this.id,
    required this.title,
    this.instructions,
    this.summary,
    this.dishTypes,
    this.image,
    this.imageType,
    this.servings = 1,
    this.readyInMinutes,
    this.spoontacularScore = 0,
    this.healthScore = 0,
    this.extendedIngredients,
  });

  @override
  List<Object?> get props => [id, title, image];
}
