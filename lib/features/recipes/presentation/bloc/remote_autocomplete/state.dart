part of 'cubit.dart';

abstract class RemoteRecipeAutocompleteState extends Equatable {
  const RemoteRecipeAutocompleteState();
}

class RemoteRecipeAutocompleteLoading extends RemoteRecipeAutocompleteState {
  const RemoteRecipeAutocompleteLoading();

  @override
  List<Object?> get props => [];
}

class RemoteRecipeAutocompleteDone extends RemoteRecipeAutocompleteState {
  final List<RecipeAutoCompleteEntity> recipes;

  const RemoteRecipeAutocompleteDone(this.recipes);

  @override
  List<Object?> get props => [recipes];
}

class RemoteRecipeAutocompleteError extends RemoteRecipeAutocompleteState {
  final DioException error;

  const RemoteRecipeAutocompleteError(this.error);

  @override
  List<Object?> get props => [error];
}
