import '../../domain/entities/params.dart';

class RandomRecipeParams extends RecipeParamsEntity {
  final int? number;
  final List<String>? tags;

  const RandomRecipeParams({this.number, this.tags});
}

class RecipeInformationParams extends RecipeParamsEntity {
  final int id;
  final bool? includeNutrition;
  const RecipeInformationParams({required this.id, this.includeNutrition});
}

class RecipeBulkInformationParams extends RecipeParamsEntity {
  final List<int>? ids;
  final bool? includeNutrition;

  const RecipeBulkInformationParams({this.ids, this.includeNutrition});
}

class RecipeSearchParams extends RecipeParamsEntity {
  const RecipeSearchParams();
}
