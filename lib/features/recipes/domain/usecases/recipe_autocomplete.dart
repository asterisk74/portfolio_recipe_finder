import 'package:recipe_finder/core/resources/data_state.dart';
import 'package:recipe_finder/core/resources/usecase.dart';
import 'package:recipe_finder/features/recipes/domain/entities/recipe_autocomplete.dart';

import '../repository/recipe_repository.dart';

class RecipeAutocompleteUseCase
    implements UseCase<DataState<List<RecipeAutoCompleteEntity>>, String> {
  final RecipeRepository _recipeRepository;

  RecipeAutocompleteUseCase(this._recipeRepository);

  @override
  Future<DataState<List<RecipeAutoCompleteEntity>>> call({String? params}) {
    return _recipeRepository.autocomplete(params);
  }

}
