

import 'package:floor/floor.dart';
import 'package:recipe_finder/features/recipes/data/models/recipe.dart';

@dao
abstract class RecipeDAO {

  @Insert()
  Future<void> insertRecipe(RecipeModel recipe);

  @delete
  Future<void> deleteRecipe(RecipeModel recipe);

  @Query('SELECT * FROM recipes')
  Future<List<RecipeModel>> getRecipes();
}