import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/core/utils/ext.dart';

import '../bloc/remote_recipe/cubit.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteRecipeCubit, RemoteRecipeState>(
        builder: (_, state) {
      if (state is RemoteRecipeLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is RemoteRecipeError) {
        return const Center(child: Text('Error'));
      }

      if (state is RemoteRecipeDone) {
        final recipe = state.recipe;

        return ListView(
          children: [
            CachedNetworkImage(
              imageUrl: recipe.image!,
              height: 300,
              placeholder: (context, _) {
                return const Center(child: CircularProgressIndicator());
              },
              errorWidget: (context, url, _) {
                return const Center(child: Icon(Icons.error));
              },
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: imageProvider,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: FractionalOffset.bottomRight,
                        end: FractionalOffset.topLeft,
                        colors: [Colors.black54, Colors.transparent],
                        stops: [0, 1],
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    recipe.readyInMinutes == null
                                        ? ''
                                        : '${recipe.readyInMinutes.toString()} mins',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.timer,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    recipe.servings == null
                                        ? ''
                                        : '${recipe.servings.toString()} people',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.people,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    recipe.readyInMinutes == null
                                        ? ''
                                        : '${recipe.readyInMinutes.toString()} g',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.restaurant_menu,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                recipe.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
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
              child: Text(
                recipe.instructions ?? 'None',
                style: const TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(height: 15),
          ],
        );
      }

      return const SizedBox.shrink();
    });
  }
}
