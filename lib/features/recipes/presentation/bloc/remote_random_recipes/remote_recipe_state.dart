part of 'remote_recipe_bloc.dart';

abstract class RemoteRandomRecipeState extends Equatable {
  final List<RecipeEntity>? recipes;
  final DioException? error;

  const RemoteRandomRecipeState({this.error, this.recipes});

  @override
  List<Object?> get props => [recipes, error];
}

class RemoteRandomRecipeLoading extends RemoteRandomRecipeState {
  const RemoteRandomRecipeLoading();
}

class RemoteRandomRecipeDone extends RemoteRandomRecipeState {
  const RemoteRandomRecipeDone(List<RecipeEntity> recipes)
      : super(recipes: recipes);
}

class RemoteRandomRecipeError extends RemoteRandomRecipeState {
  const RemoteRandomRecipeError(DioException error) : super(error: error);
}
