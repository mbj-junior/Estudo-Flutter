import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/models/cetegory.dart';
import 'package:meals/components/meal_item.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesMealsScreen({Key? key, required this.meals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: ((context, index) {
            return MealItem(meal: categoryMeals[index]);
          })),
    );
  }
}
