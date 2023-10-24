import 'package:recipe_finder/core/resources/usecase.dart';
import 'package:recipe_finder/features/recipes/data/models/params.dart';
import 'package:recipe_finder/features/recipes/domain/entities/recipe.dart';

import '../../../../core/resources/data_state.dart';
import '../repository/recipe_repository.dart';

class GetRecipeUseCase
    implements UseCase<DataState<RecipeEntity>, RecipeInformationParams> {
  final RecipeRepository _recipeRepository;

  GetRecipeUseCase(this._recipeRepository);

  @override
  Future<DataState<RecipeEntity>> call({RecipeInformationParams? params}) {
    return _recipeRepository.getRecipe(params!.id, params: params);
  }
}
