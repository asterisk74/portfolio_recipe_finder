import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/core/resources/data_state.dart';

import '../../../data/models/params.dart';
import '../../../domain/entities/recipe.dart';
import '../../../domain/usecases/get_random_recipes.dart';

part 'remote_recipe_event.dart';

part 'remote_recipe_state.dart';

class RemoteRandomRecipeBloc
    extends Bloc<RemoteRandomRecipeEvent, RemoteRandomRecipeState> {
  final GetRandomRecipeUseCase _getRandomRecipeUseCase;

  RemoteRandomRecipeBloc(this._getRandomRecipeUseCase)
      : super(const RemoteRandomRecipeLoading()) {
    on<GetRandomRecipe>(onGetRecipe);
  }

  Future<void> onGetRecipe(
    GetRandomRecipe event,
    Emitter<RemoteRandomRecipeState> emit,
  ) async {
    final dataState = await _getRandomRecipeUseCase(
      params: const RandomRecipeParams(number: 5),
    );

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteRandomRecipeDone(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(RemoteRandomRecipeError(dataState.error!));
    }
  }
}
