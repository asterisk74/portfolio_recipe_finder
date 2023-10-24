import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_finder/features/recipes/data/sources/local/app_database.dart';
import 'package:recipe_finder/features/recipes/domain/usecases/get_favorite_recipes.dart';
import 'package:recipe_finder/features/recipes/domain/usecases/get_recipe.dart';
import 'package:recipe_finder/features/recipes/domain/usecases/get_recipes.dart';
import 'package:recipe_finder/features/recipes/domain/usecases/remove_recipe_from_favorites.dart';
import 'package:recipe_finder/features/recipes/domain/usecases/save_recipe_to_favorites.dart';
import 'package:recipe_finder/features/recipes/presentation/bloc/local_favorites/cubit.dart';

import 'features/recipes/data/repository/recipe_repository.dart';
import 'features/recipes/data/sources/remote/recipe_api_service.dart';
import 'features/recipes/domain/repository/recipe_repository.dart';
import 'features/recipes/domain/usecases/get_random_recipes.dart';
import 'features/recipes/domain/usecases/recipe_autocomplete.dart';
import 'features/recipes/presentation/bloc/remote_autocomplete/cubit.dart';
import 'features/recipes/presentation/bloc/remote_random_recipes/remote_recipe_bloc.dart';
import 'features/recipes/presentation/bloc/remote_recipe/cubit.dart';
import 'features/recipes/presentation/bloc/remote_recipes/cubit.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final db = await $FloorAppDatabase.databaseBuilder('app_database').build();

  sl.registerSingleton<AppDatabase>(db);
  sl.registerSingleton<Dio>(Dio());

  // ###------------- Recipes -------------###
  // ###
  sl.registerSingleton<RecipeAPIService>(RecipeAPIService(sl()));
  sl.registerSingleton<RecipeRepository>(RecipeRepositoryImpl(sl(), sl()));

  // -- Recipe use cases
  sl.registerSingleton<GetRandomRecipeUseCase>(GetRandomRecipeUseCase(sl()));
  sl.registerLazySingleton<RecipeAutocompleteUseCase>(
    () => RecipeAutocompleteUseCase(sl()),
  );
  sl.registerLazySingleton<GetRecipesUseCase>(() => GetRecipesUseCase(sl()));
  sl.registerLazySingleton<GetRecipeUseCase>(() => GetRecipeUseCase(sl()));

  sl.registerSingleton<GetFavoriteRecipesUseCase>(
    GetFavoriteRecipesUseCase(sl()),
  );
  sl.registerLazySingleton<SaveRecipeToFavoritesUseCase>(
    () => SaveRecipeToFavoritesUseCase(sl()),
  );
  sl.registerLazySingleton<RemoveRecipeFromFavoritesUseCase>(
    () => RemoveRecipeFromFavoritesUseCase(sl()),
  );

  // -- Recipe blocs / cubits
  sl.registerFactory<RemoteRecipeAutocompleteCubit>(
    () => RemoteRecipeAutocompleteCubit(sl()),
  );
  sl.registerFactory<RemoteRandomRecipeBloc>(
    () => RemoteRandomRecipeBloc(sl()),
  );
  sl.registerFactory<RemoteRecipesCubit>(
    () => RemoteRecipesCubit(sl()),
  );
  sl.registerFactory<RemoteRecipeCubit>(
    () => RemoteRecipeCubit(sl()),
  );

  sl.registerFactory<LocalFavoriteRecipesCubit>(
    () => LocalFavoriteRecipesCubit(sl(), sl(), sl()),
  );
}
