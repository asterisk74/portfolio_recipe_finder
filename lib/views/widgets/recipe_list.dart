import 'package:flutter/material.dart';
import 'package:recipe_finder/views/widgets/recipe_card.dart';

import '../../api/recipe.api.dart';
import '../../models/recipe.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({Key? key}) : super(key: key);

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipes();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(itemBuilder: (context, index) {
      final recipe = _recipes[index];
      return RecipeCard(food: recipe.food, measures: recipe.measures);
    });
  }
}
