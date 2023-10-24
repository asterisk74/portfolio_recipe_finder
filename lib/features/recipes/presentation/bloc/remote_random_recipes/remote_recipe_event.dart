part of 'remote_recipe_bloc.dart';

abstract class RemoteRandomRecipeEvent {
  const RemoteRandomRecipeEvent();
}

class GetRandomRecipe extends RemoteRandomRecipeEvent {
  final int? number;
  const GetRandomRecipe({this.number});
}
