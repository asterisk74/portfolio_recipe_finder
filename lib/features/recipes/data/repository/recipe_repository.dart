import 'dart:io';

import 'package:dio/dio.dart';
import 'package:recipe_finder/core/resources/data_state.dart';
import 'package:recipe_finder/features/recipes/data/models/params.dart';
import '../../domain/repository/recipe_repository.dart';
import '../models/recipe.dart';
import '../sources/remote/recipe_api_service.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final RecipeAPIService _apiService;

  RecipeRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<RecipeModel>>> getRandomRecipes({
    RandomRecipeParams? params,
  }) async {
    try {
      final httpResponse = await _apiService.getRandomRecipes(
        number: params?.number,
        tags: params?.tags,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.recipes ?? []);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<RecipeModel>>> getRecipes({
    RecipeBulkInformationParams? params,
  }) async {
    try {
      final httpResponse = await _apiService.getRecipes(
        ids: params?.ids,
        includeNutrition: params?.includeNutrition,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<RecipeModel>> getRecipe(
    int id, {
    RecipeInformationParams? params,
  }) async {
    try {
      final httpResponse = await _apiService.getRecipe(
        id,
        includeNutrition: params?.includeNutrition,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
