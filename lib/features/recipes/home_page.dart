import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_finder/injection_container.dart';

import 'presentation/bloc/local_favorites/cubit.dart';
import 'presentation/bloc/remote_autocomplete/cubit.dart';
import 'presentation/bloc/remote_random_recipes/remote_recipe_bloc.dart';
import 'presentation/widgets/sliver_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteRandomRecipeBloc>(
          create: (context) => sl()..add(const GetRandomRecipe()),
        ),
        BlocProvider<LocalFavoriteRecipesCubit>(
          create: (context) => sl()..getFavorites(),
        ),
        BlocProvider<RemoteRecipeAutocompleteCubit>(create: (context) => sl()),
      ],
      child: const Scaffold(
        body: SliverHome(),

        // Container(
        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.topRight,
        //       end: Alignment.bottomLeft,
        //       colors: [
        //         Color.fromARGB(255, 209, 236, 243),
        //         Color.fromARGB(255, 236, 243, 253),
        //         Color.fromARGB(255, 159, 199, 225),
        //       ],
        //     ),
        //   ),
        //   child: SafeArea(
        //     child: Column(
        //       children: [
        //         // Custom Appbar
        //         Padding(
        //           padding: const EdgeInsets.symmetric(
        //             horizontal: 25,
        //             vertical: 20,
        //           ),
        //           child: Align(
        //             alignment: Alignment.topLeft,
        //             child: Text(
        //               'Find The Best Recipe',
        //               style: GoogleFonts.nunito(
        //                   fontWeight: FontWeight.w800, fontSize: 25),
        //             ),
        //           ),
        //         ),
        //
        //         // Search box
        //         const RecipeFilterBar(),
        //
        //         const SizedBox(height: 20),
        //
        //         Expanded(
        //           child: ListView(
        //             children: const [
        //               FavoritesList(),
        //               SizedBox(height: 20),
        //               JustForYouList(),
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
