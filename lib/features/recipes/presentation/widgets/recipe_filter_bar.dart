import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_finder/injection_container.dart';

import '../bloc/remote_autocomplete/cubit.dart';

class RecipeFilterBar extends StatelessWidget {
  const RecipeFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        readOnly: true,
        onTap: () {
          showSearch(
            context: context,
            delegate: SearchFoodDelegate(sl()),
          );
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          hintText: 'Search food...',
        ),
      ),
    );
  }
}

class SearchFoodDelegate extends SearchDelegate {
  final RemoteRecipeAutocompleteCubit autocompleteCubit;

  SearchFoodDelegate(this.autocompleteCubit);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    autocompleteCubit.search(query);

    return BlocBuilder<RemoteRecipeAutocompleteCubit,
        RemoteRecipeAutocompleteState>(
      bloc: autocompleteCubit,
      builder: (ctx, state) {
        if (state is RemoteRecipeAutocompleteLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is RemoteRecipeAutocompleteError) {
          return const Center(child: Text('Error'));
        }

        if (state is RemoteRecipeAutocompleteDone) {
          final matches = state.recipes;

          return ListView.builder(
            itemCount: matches.length,
            itemBuilder: (context, index) {
              final match = matches[index];
              return ListTile(
                title: Text(match.title),
                onTap: () {
                  context.push(context.namedLocation(
                    'recipe_details',
                    pathParameters: <String, String>{'id': match.id.toString()},
                  ));
                },
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}
