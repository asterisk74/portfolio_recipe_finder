import 'package:recipe_finder/core/resources/usecase.dart';
import 'package:recipe_finder/features/recipes/data/models/params.dart';
import 'package:recipe_finder/features/recipes/domain/entities/recipe.dart';

import '../../../../core/resources/data_state.dart';
import '../repository/recipe_repository.dart';

class GetRecipesUseCase
    implements UseCase<DataState<List<RecipeEntity>>, RecipeBulkInformationParams> {
  final RecipeRepository _recipeRepository;

  GetRecipesUseCase(this._recipeRepository);

  @override
  Future<DataState<List<RecipeEntity>>> call({RecipeBulkInformationParams? params}) {
    return _recipeRepository.getRecipes(params: params);
  }
}
