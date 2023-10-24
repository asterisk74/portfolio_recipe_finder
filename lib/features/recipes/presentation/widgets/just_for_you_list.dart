import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/remote_random_recipes/remote_recipe_bloc.dart';
import 'home_recipe.dart';

class JustForYouList extends StatelessWidget {
  const JustForYouList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteRandomRecipeBloc, RemoteRandomRecipeState>(
      builder: (_, state) {
        if (state is RemoteRandomRecipeLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is RemoteRandomRecipeError) {
          return const Center(child: Text('Error'));
        }

        if (state is RemoteRandomRecipeDone) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.recipes!.length + 1,
            padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
            separatorBuilder: (context, index) {
              return const SizedBox(height: 18);
            },
            itemBuilder: (_, index) {
              if (index <= 0) {
                return const Text(
                  'Just for you',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                );
              }

              return HomeRecipe(recipe: state.recipes![index - 1]);
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
