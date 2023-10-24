import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/recipe.dart';

part 'recipe.g.dart';

@JsonSerializable()
class RecipeModel extends RecipeEntity {
  const RecipeModel({
    required super.id,
    required super.title,
    super.summary,
    super.image,
    super.imageType,
    super.servings,
    super.readyInMinutes,
    super.spoontacularScore,
    super.healthScore,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);
}

@JsonSerializable()
class RandomRecipeResponseData {
  final List<RecipeModel>? recipes;

  RandomRecipeResponseData({this.recipes});

  factory RandomRecipeResponseData.fromJson(Map<String, dynamic> json) =>
      _$RandomRecipeResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$RandomRecipeResponseDataToJson(this);
}
