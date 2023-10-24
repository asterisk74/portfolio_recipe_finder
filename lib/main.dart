import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_finder/config/router.dart';
import 'package:recipe_finder/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      child: MaterialApp.router(
        title: 'Recipe Finder',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          primaryColor: Colors.white,
        ),
        routerConfig: router,
      ),
    );
  }
}
