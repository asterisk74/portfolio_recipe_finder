part of 'cubit.dart';

abstract class LocalFavoriteRecipesState extends Equatable {
  final List<RecipeEntity>? recipes;

  const LocalFavoriteRecipesState({this.recipes});

  @override
  List<Object?> get props => [recipes];
}

class LocalFavoriteRecipesLoading extends LocalFavoriteRecipesState {
  const LocalFavoriteRecipesLoading();

  @override
  List<Object?> get props => [];
}

class LocalFavoriteRecipesDone extends LocalFavoriteRecipesState {
  const LocalFavoriteRecipesDone(
    List<RecipeEntity> recipes,
  ) : super(recipes: recipes);
}

class LocalFavoriteRecipesError extends LocalFavoriteRecipesState {
  final DioException error;

  const LocalFavoriteRecipesError(this.error);

  @override
  List<Object?> get props => [error];
}
