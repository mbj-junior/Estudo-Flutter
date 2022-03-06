import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          fontFamily: 'Raleway',
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber),
          textTheme: ThemeData.light().textTheme.copyWith(
                titleMedium: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'RobotoCondensed',
                ),
              )),
      routes: {
        '/' : (context) => const CategoriesScreen(),
        '/categories-meals': (context) => const CategoriesMealsScreen()},
    );
  }
}
