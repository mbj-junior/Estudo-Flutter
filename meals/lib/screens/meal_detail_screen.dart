import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: const Center(
        child: Text('Detalhe da refeição'),
      ),
    );
  }
}
