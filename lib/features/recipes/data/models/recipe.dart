import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_finder/features/recipes/data/models/ingredient.dart';

import '../../domain/entities/recipe.dart';

part 'recipe.g.dart';

@JsonSerializable()
@Entity(tableName: 'recipes', primaryKeys: ['id'])
class RecipeModel extends RecipeEntity {
  @override
  @ignore
  final List<IngredientModel>? extendedIngredients;

  @override
  @ignore
  final List<String>? dishTypes;

  const RecipeModel({
    required super.id,
    required super.title,
    super.instructions,
    super.summary,
    super.image,
    super.imageType,
    super.servings,
    super.readyInMinutes,
    super.spoontacularScore,
    super.healthScore,
    this.extendedIngredients,
    this.dishTypes,
  }) : super(extendedIngredients: extendedIngredients, dishTypes: dishTypes);

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);

  factory RecipeModel.fromEntity(RecipeEntity entity) {
    return RecipeModel(
      id: entity.id,
      title: entity.title,
      instructions: entity.instructions,
      dishTypes: entity.dishTypes,
      summary: entity.summary,
      image: entity.image,
      imageType: entity.imageType,
      servings: entity.servings,
      readyInMinutes: entity.readyInMinutes,
      spoontacularScore: entity.spoontacularScore,
      healthScore: entity.healthScore,
    );
  }
}

@JsonSerializable()
class RandomRecipeResponseData {
  final List<RecipeModel>? recipes;

  RandomRecipeResponseData({this.recipes});

  factory RandomRecipeResponseData.fromJson(Map<String, dynamic> json) =>
      _$RandomRecipeResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$RandomRecipeResponseDataToJson(this);
}
