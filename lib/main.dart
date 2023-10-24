import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_finder/features/food/food_page.dart';
import 'package:recipe_finder/injection_container.dart';
import 'features/recipes/home_page.dart';

Future<void> main() async {
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: MaterialApp(
        title: 'Recipe Finder',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          primaryColor: Colors.white,
        ),
        routes: {'/food_page': (context) => const FoodPage()},
        home: const HomePage(),
      ),
    );
  }
}
