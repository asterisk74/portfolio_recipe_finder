import '../../../../core/resources/data_state.dart';
import '../../data/models/params.dart';
import '../../data/models/recipe.dart';

abstract class RecipeRepository {
  Future<DataState<RecipeModel>> getRecipe(
    int id, {
    RecipeInformationParams? params,
  });

  Future<DataState<List<RecipeModel>>> getRecipes({
    RecipeBulkInformationParams? params,
  });

  Future<DataState<List<RecipeModel>>> getRandomRecipes({
    RandomRecipeParams? params,
  });
}
