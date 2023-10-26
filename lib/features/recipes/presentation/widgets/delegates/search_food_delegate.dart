import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/remote_autocomplete/cubit.dart';

class SearchFoodDelegate extends SearchDelegate {
  final RemoteRecipeAutocompleteCubit autocompleteCubit;

  SearchFoodDelegate(this.autocompleteCubit);

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Colors.grey[50],
      appBarTheme: theme.appBarTheme.copyWith(
        elevation: 0,
      ),
      textTheme: theme.textTheme.copyWith(
        titleLarge: const TextStyle(color: Colors.white),
      ),
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        hintStyle: const TextStyle(color: Colors.white70),
      ),
    );
  }

  @override
  String? get searchFieldLabel => 'Enter food name...';

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
