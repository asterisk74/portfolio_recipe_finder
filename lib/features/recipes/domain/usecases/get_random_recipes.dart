import 'package:recipe_finder/core/resources/data_state.dart';
import 'package:recipe_finder/core/resources/usecase.dart';

import '../../data/models/params.dart';
import '../entities/recipe.dart';
import '../repository/recipe_repository.dart';

class GetRandomRecipeUseCase
    implements UseCase<DataState<List<RecipeEntity>>, RandomRecipeParams> {
  final RecipeRepository _recipeRepository;

  GetRandomRecipeUseCase(this._recipeRepository);

  @override
  Future<DataState<List<RecipeEntity>>> call({
    RandomRecipeParams? params,
  }) {
    return _recipeRepository.getRandomRecipes(params: params);
  }
}
