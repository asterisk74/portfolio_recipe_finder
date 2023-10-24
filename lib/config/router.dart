import 'package:go_router/go_router.dart';

import '../features/recipes/home_page.dart';
import '../features/recipes/recipe_details_page.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    name: 'home',
    builder: (context, state) => const HomePage(),
    routes: <RouteBase>[
      GoRoute(
          path: 'recipe_details/:id',
          name: 'recipe_details',
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            return RecipeDetailsPage(id: id);
          }),
    ],
  ),
]);
