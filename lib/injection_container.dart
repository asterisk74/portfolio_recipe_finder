import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_finder/features/recipes/domain/usecases/get_recipe.dart';
import 'package:recipe_finder/features/recipes/domain/usecases/get_recipes.dart';

import 'features/recipes/data/repository/recipe_repository.dart';
import 'features/recipes/data/sources/remote/recipe_api_service.dart';
import 'features/recipes/domain/repository/recipe_repository.dart';
import 'features/recipes/domain/usecases/get_random_recipes.dart';
import 'features/recipes/presentation/bloc/remote_random_recipes/remote_recipe_bloc.dart';
import 'features/recipes/presentation/bloc/remote_recipe/cubit.dart';
import 'features/recipes/presentation/bloc/remote_recipes/cubit.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  // ###------------- Recipes -------------###
  sl.registerSingleton<RecipeAPIService>(RecipeAPIService(sl()));
  sl.registerSingleton<RecipeRepository>(RecipeRepositoryImpl(sl()));

  // -- Recipe use cases
  sl.registerSingleton<GetRandomRecipeUseCase>(GetRandomRecipeUseCase(sl()));
  sl.registerLazySingleton<GetRecipesUseCase>(() => GetRecipesUseCase(sl()));
  sl.registerLazySingleton<GetRecipeUseCase>(() => GetRecipeUseCase(sl()));

  // -- Recipe blocs
  sl.registerFactory<RemoteRandomRecipeBloc>(
    () => RemoteRandomRecipeBloc(sl()),
  );
  sl.registerFactory<RemoteRecipesCubit>(
    () => RemoteRecipesCubit(sl()),
  );
   sl.registerFactory<RemoteRecipeCubit>(
    () => RemoteRecipeCubit(sl()),
  );
}
