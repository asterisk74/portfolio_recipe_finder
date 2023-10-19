import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:recipe_finder/models/recipe.dart';

class RecipeApi {
  // const req = unirest('GET', 'https://edamam-food-and-grocery-database.p.rapidapi.com/api/food-database/v2/parser');
  //
  // req.query({
  // 'nutrition-type': 'cooking',
  // 'category[0]': 'generic-foods',
  // 'health[0]': 'alcohol-free'
  // });
  //
  // req.headers({
  // 'X-RapidAPI-Key': '4672ee4d86msh5771f8b55c4d524p103600jsn6bb8ba8dc960',
  // 'X-RapidAPI-Host': 'edamam-food-and-grocery-database.p.rapidapi.com'
  // });

  static Future<List<Recipe>> getRecipes() async {
    var uri = Uri.https(
      'edamam-food-and-grocery-database.p.rapidapi.com',
      '/api/food-database/v2/parser',
      {
        'nutrition-type': 'cooking',
        'category[0]': 'generic-foods',
        'health[0]': 'alcohol-free',
      },
    );

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '4672ee4d86msh5771f8b55c4d524p103600jsn6bb8ba8dc960',
      'X-RapidAPI-Host': 'edamam-food-and-grocery-database.p.rapidapi.com',
      'useQueryString': "true"
    });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['hints']) {
      temp.add(i);
    }

    return Recipe.recipesFromSnapshot(temp);
  }
}
