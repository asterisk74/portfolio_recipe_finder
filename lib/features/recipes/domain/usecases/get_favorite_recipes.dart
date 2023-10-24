import 'package:recipe_finder/core/resources/usecase.dart';
import 'package:recipe_finder/features/recipes/domain/entities/recipe.dart';

import '../repository/recipe_repository.dart';

class GetFavoriteRecipesUseCase implements UseCase<List<RecipeEntity>, void> {
  final RecipeRepository _recipeRepository;

  GetFavoriteRecipesUseCase(this._recipeRepository);

  @override
  Future<List<RecipeEntity>> call({void params}) {
    return _recipeRepository.getFavoriteRecipes();
  }
}
