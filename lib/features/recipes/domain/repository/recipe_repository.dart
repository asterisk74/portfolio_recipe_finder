import 'package:recipe_finder/features/recipes/domain/entities/recipe.dart';
import 'package:recipe_finder/features/recipes/domain/entities/recipe_autocomplete.dart';

import '../../../../core/resources/data_state.dart';
import '../../data/models/params.dart';

abstract class RecipeRepository {
  // Remote methods
  Future<DataState<List<RecipeAutoCompleteEntity>>> autocomplete(String? q);

  Future<DataState<RecipeEntity>> getRecipe(
    int id, {
    RecipeInformationParams? params,
  });

  Future<DataState<List<RecipeEntity>>> getRecipes({
    RecipeBulkInformationParams? params,
  });

  Future<DataState<List<RecipeEntity>>> getRandomRecipes({
    RandomRecipeParams? params,
  });

  // LOCAL methods
  Future<List<RecipeEntity>> getFavoriteRecipes();

  Future<void> saveToFavorites(RecipeEntity recipe);

  Future<void> removeFavorite(RecipeEntity recipe);
}
