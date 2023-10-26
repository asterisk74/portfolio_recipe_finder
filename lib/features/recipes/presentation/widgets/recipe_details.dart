import 'package:flutter/material.dart';
import 'package:recipe_finder/core/utils/ext.dart';
import 'package:recipe_finder/features/recipes/domain/entities/recipe.dart';

import 'recipe_detail_hero.dart';
import 'recipe_instructions.dart';

class RecipeDetails extends StatelessWidget {
  final RecipeEntity recipe;

  const RecipeDetails({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RecipeDetailHero(
          image: recipe.image!,
          duration: recipe.readyInMinutes.toString(),
          size: recipe.servings.toString(),
          servings: recipe.servings.toString(),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            recipe.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 30,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            children: (recipe.dishTypes ?? []).map((e) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 4,
                ),
                margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.teal,
                ),
                child: Center(
                  child: Text(
                    e.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DataTable(
              columnSpacing: 30,
              columns: const [
                DataColumn(label: Text('INGREDIENT')),
                DataColumn(label: Text('AMOUNT'), numeric: true),
                DataColumn(label: Text('UNIT')),
              ],
              rows: (recipe.extendedIngredients ?? []).map((e) {
                return DataRow(cells: [
                  DataCell(Text(e.name.toTitleCase())),
                  DataCell(Text(e.amount.toString())),
                  DataCell(Text(e.unit.toCapitalized())),
                ]);
              }).toList()),
        ),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Instructions',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RecipeInstructions(instructions: recipe.instructions ?? ''),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
