import 'package:dio/dio.dart' hide Headers;
import 'package:recipe_finder/core/constants/constants.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/recipe.dart';

part 'recipe_api_service.g.dart';

@RestApi(baseUrl: spoonacularAPIBaseURL)
abstract class RecipeAPIService {
  factory RecipeAPIService(Dio dio) = _RecipeAPIService;

  @GET('/recipes/random')
  @Headers(<String, dynamic>{'x-api-key': spoonacularAPIKey})
  Future<HttpResponse<RandomRecipeResponseData>> getRandomRecipes({
    @Query('number') int? number = 1,
    @Query('tags') List<String>? tags,
  });

  @GET('/recipes/informationBulk')
  @Headers(<String, dynamic>{'x-api-key': spoonacularAPIKey})
  Future<HttpResponse<List<RecipeModel>>> getRecipes({
    @Query('ids') List<int>? ids,
    @Query('includeNutrition') bool? includeNutrition,
  });

  @GET('/recipes/{id}/information')
  @Headers(<String, dynamic>{'x-api-key': spoonacularAPIKey})
  Future<HttpResponse<RecipeModel>> getRecipe(
    @Path('id') int id, {
    @Query('includeNutrition') bool? includeNutrition,
  });
}
