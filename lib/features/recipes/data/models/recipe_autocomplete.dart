import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_finder/features/recipes/domain/entities/recipe_autocomplete.dart';

part 'recipe_autocomplete.g.dart';

@JsonSerializable()
class RecipeAutoCompleteModel extends RecipeAutoCompleteEntity {
  const RecipeAutoCompleteModel({required super.id, required super.title});

  factory RecipeAutoCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeAutoCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeAutoCompleteModelToJson(this);
}
