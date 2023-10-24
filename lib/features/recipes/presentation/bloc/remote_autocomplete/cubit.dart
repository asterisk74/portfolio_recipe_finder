import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/features/recipes/domain/entities/recipe_autocomplete.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/usecases/recipe_autocomplete.dart';

part 'state.dart';

class RemoteRecipeAutocompleteCubit
    extends Cubit<RemoteRecipeAutocompleteState> {
  final RecipeAutocompleteUseCase _recipeAutocomplete;

  RemoteRecipeAutocompleteCubit(this._recipeAutocomplete)
      : super(const RemoteRecipeAutocompleteLoading());

  Future<void> search(String? q) async {
    final dataState = await _recipeAutocomplete(
      params: q,
    );

    if (dataState is DataSuccess && dataState.data != null) {
      emit(RemoteRecipeAutocompleteDone(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(RemoteRecipeAutocompleteError(dataState.error!));
    }
  }
}
