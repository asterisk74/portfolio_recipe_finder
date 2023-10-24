import 'package:recipe_finder/core/resources/usecase.dart';
import 'package:recipe_finder/features/recipes/domain/entities/recipe.dart';

import '../repository/recipe_repository.dart';

class SaveRecipeToFavoritesUseCase implements UseCase<void, RecipeEntity> {
  final RecipeRepository _recipeRepository;

  SaveRecipeToFavoritesUseCase(this._recipeRepository);

  @override
  Future<void> call({RecipeEntity? params}) {
    return _recipeRepository.saveToFavorites(params!);
  }
}
