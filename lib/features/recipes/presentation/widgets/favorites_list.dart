import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/local_favorites/cubit.dart';
import 'home_recipe.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalFavoriteRecipesCubit, LocalFavoriteRecipesState>(
      builder: (_, state) {
        final recipes = state.recipes ?? [];

        if (state is LocalFavoriteRecipesLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is LocalFavoriteRecipesError) {
          return const Center(child: Text('Error'));
        }

        if (state is LocalFavoriteRecipesDone && recipes.isNotEmpty) {
          return SizedBox(
            height: 270,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Favorites',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            splashFactory: NoSplash.splashFactory,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: Size.zero, // Set this
                            padding: EdgeInsets.zero, // and this
                          ),
                          child: const Text('View All'))
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.recipes!.length,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 15);
                    },
                    itemBuilder: (context, index) {
                      return HomeRecipe(
                        recipe: state.recipes![index],
                        orientation: Orientation.portrait,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
