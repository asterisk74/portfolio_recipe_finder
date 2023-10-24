import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_finder/features/recipes/domain/entities/ingredient.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class IngredientModel extends IngredientEntity {
  const IngredientModel({
    required super.id,
    required super.name,
    required super.unit,
    required super.amount,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientModelFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientModelToJson(this);
}
