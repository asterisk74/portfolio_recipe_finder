import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/features/recipes/domain/usecases/get_favorite_recipes.dart';
import 'package:recipe_finder/features/recipes/domain/usecases/remove_recipe_from_favorites.dart';
import 'package:recipe_finder/features/recipes/domain/usecases/save_recipe_to_favorites.dart';

import '../../../domain/entities/recipe.dart';

part 'state.dart';

class LocalFavoriteRecipesCubit extends Cubit<LocalFavoriteRecipesState> {
  final GetFavoriteRecipesUseCase _getFavoriteRecipesUseCase;
  final SaveRecipeToFavoritesUseCase _saveRecipeToFavoritesUseCase;
  final RemoveRecipeFromFavoritesUseCase _removeRecipeFromFavoritesUseCase;

  LocalFavoriteRecipesCubit(
    this._getFavoriteRecipesUseCase,
    this._saveRecipeToFavoritesUseCase,
    this._removeRecipeFromFavoritesUseCase,
  ) : super(const LocalFavoriteRecipesLoading());

  Future<void> getFavorites() async {
    final favorites = await _getFavoriteRecipesUseCase();
    emit(LocalFavoriteRecipesDone(favorites));
  }

  Future<void> saveToFavorites(RecipeEntity entity) async {
    await _saveRecipeToFavoritesUseCase(params: entity);
    getFavorites();
  }

  Future<void> removeFromFavorites(RecipeEntity entity) async {
    await _removeRecipeFromFavoritesUseCase(params: entity);
    getFavorites();
  }
}
