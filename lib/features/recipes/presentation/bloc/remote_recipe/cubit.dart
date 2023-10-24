import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/entities/recipe.dart';
import '../../../domain/usecases/get_recipe.dart';

part 'state.dart';

class RemoteRecipeCubit extends Cubit<RemoteRecipeState> {
  final GetRecipeUseCase _getRecipeUseCase;

  RemoteRecipeCubit(this._getRecipeUseCase)
      : super(const RemoteRecipeLoading());

  Future<void> getRecipe(int id) async {
    final dataState = await _getRecipeUseCase();

    if (dataState is DataSuccess && dataState.data != null) {
      emit(RemoteRecipeDone(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(RemoteRecipesError(dataState.error!));
    }
  }
}
