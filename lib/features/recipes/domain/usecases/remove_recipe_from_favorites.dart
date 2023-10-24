import 'package:recipe_finder/core/resources/usecase.dart';
import 'package:recipe_finder/features/recipes/domain/entities/recipe.dart';

import '../repository/recipe_repository.dart';

class RemoveRecipeFromFavoritesUseCase implements UseCase<void, RecipeEntity> {
  final RecipeRepository _recipeRepository;

  RemoveRecipeFromFavoritesUseCase(this._recipeRepository);

  @override
  Future<void> call({RecipeEntity? params}) {
    return _recipeRepository.removeFavorite(params!);
  }
}
