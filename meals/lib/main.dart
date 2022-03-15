import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/categories_meals_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          fontFamily: 'Raleway',
          primarySwatch: Colors.pink,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                titleMedium: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'RobotoCondensed',
                ),
              )),
      routes: {
        AppRoutes.home: (context) => const TabsScreen(),
        AppRoutes.settings: (context) => const SettingsScreen(),
        AppRoutes.mealDetail: (context) => const MealDetailScreen(),
        AppRoutes.categoriesMeals: (context) => const CategoriesMealsScreen(),
      },
    );
  }
}
