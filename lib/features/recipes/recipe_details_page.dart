import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';
import 'presentation/bloc/remote_recipe/cubit.dart';
import 'presentation/widgets/recipe_details/sliver_details.dart';

class RecipeDetailsPage extends StatelessWidget {
  final int id;

  const RecipeDetailsPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteRecipeCubit>(
          create: (context) => sl()..getRecipe(id),
        ),
      ],
      child: const Scaffold(
        body:SliverDetails()
        // BlocBuilder<RemoteRecipeCubit, RemoteRecipeState>(
        //   builder: (context, state) {
        //     if (state is RemoteRecipeLoading) {
        //       return const Center(child: CircularProgressIndicator());
        //     }
        //
        //     if (state is RemoteRecipeError) {
        //       return const Center(child: Text('Error'));
        //     }
        //
        //     if (state is RemoteRecipeDone) {
        //       return TabBarView(children: [
        //         const Icon(Icons.directions_car),
        //         RecipeInstructions(
        //           instructions: state.recipe.instructions ?? '',
        //         ),
        //       ]);
        //     }
        //
        //     return const SizedBox.shrink();
        //   },
        // ),
      ),
    );
  }
}
