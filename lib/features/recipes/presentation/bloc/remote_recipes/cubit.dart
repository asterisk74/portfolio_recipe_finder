import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/entities/recipe.dart';
import '../../../domain/usecases/get_recipes.dart';

part 'state.dart';

class RemoteRecipesCubit extends Cubit<RemoteRecipesState> {
  final GetRecipesUseCase _getRecipesUseCase;

  RemoteRecipesCubit(this._getRecipesUseCase)
      : super(const RemoteRecipesLoading());

  Future<void> getRecipes() async {
    final dataState = await _getRecipesUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteRecipesDone(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(RemoteRecipesError(dataState.error!));
    }
  }
}
