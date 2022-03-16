import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/utils/app_routes.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/categories_meals_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();

  List<Meal> _availableMeals = dummyMeals;

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGluttenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

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
        AppRoutes.settings: (context) =>
            SettingsScreen(onSettingsChanged: _filterMeals, settings: settings),
        AppRoutes.mealDetail: (context) => const MealDetailScreen(),
        AppRoutes.categoriesMeals: (context) =>
            CategoriesMealsScreen(meals: _availableMeals),
      },
    );
  }
}
