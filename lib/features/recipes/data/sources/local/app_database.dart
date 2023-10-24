
import 'package:floor/floor.dart';

import '../../models/recipe.dart';
import 'DAO/recipe_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';

@Database(version: 1, entities: [RecipeModel])
abstract class AppDatabase extends FloorDatabase {
  RecipeDAO get recipeDAO;
}