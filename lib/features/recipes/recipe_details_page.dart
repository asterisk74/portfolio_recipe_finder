import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../injection_container.dart';
import 'presentation/bloc/remote_recipe/cubit.dart';
import 'presentation/widgets/recipe_details.dart';

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
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 209, 236, 243),
                Color.fromARGB(255, 236, 243, 253),
                Color.fromARGB(255, 159, 199, 225),
              ],
            ),
          ),
          child: SafeArea(
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                const RecipeDetails(),
                Positioned(
                  top: 10,
                  left: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RawMaterialButton(
                        onPressed: () => context.pop(),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        elevation: 0,
                        fillColor: Colors.black54.withOpacity(0.3),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        constraints: const BoxConstraints(),
                        child:
                            const Icon(Icons.arrow_back, color: Colors.white),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
