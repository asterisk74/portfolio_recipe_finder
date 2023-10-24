part of 'cubit.dart';

abstract class RemoteRecipesState extends Equatable {
  final List<RecipeEntity>? recipes;

  const RemoteRecipesState({this.recipes});

  @override
  List<Object?> get props => [recipes];
}

class RemoteRecipesLoading extends RemoteRecipesState {
  const RemoteRecipesLoading();

  @override
  List<Object?> get props => [];
}

class RemoteRecipesDone extends RemoteRecipesState {
  const RemoteRecipesDone(List<RecipeEntity> recipes) : super(recipes: recipes);
}

class RemoteRecipesError extends RemoteRecipesState {
  final DioException error;

  const RemoteRecipesError(this.error);

  @override
  List<Object?> get props => [error];
}
