part of 'cubit.dart';

abstract class RemoteRecipeState extends Equatable {
  const RemoteRecipeState();
}

class RemoteRecipeLoading extends RemoteRecipeState {
  const RemoteRecipeLoading();

  @override
  List<Object?> get props => [];
}

class RemoteRecipeDone extends RemoteRecipeState {
  final RecipeEntity recipe;

  const RemoteRecipeDone(this.recipe);

  @override
  List<Object?> get props => [recipe];
}

class RemoteRecipesError extends RemoteRecipeState {
  final DioException error;

  const RemoteRecipesError(this.error);

  @override
  List<Object?> get props => [error];
}
