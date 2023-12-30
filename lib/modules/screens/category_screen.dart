import 'package:flutter/material.dart';
import 'package:orderanytime/modules/category/category.dart';
import 'package:orderanytime/modules/data/dummy_data.dart';
import 'package:orderanytime/modules/screens/meal_screen.dart';
import 'package:orderanytime/modules/widget/categorygrid.dart';

import '../category/meal.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {Key? key, required this.onTaggleFavorite, required this.availableMeals})
      : super(key: key);

  final void Function(Meal meal) onTaggleFavorite;

  final List<Meal> availableMeals;

  void selectCategory(BuildContext context, Category category) {
    final filteredMeal = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          title: category.title,
          meals: filteredMeal,
          onTaggleFavorite: onTaggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGrid(
              category: category,
              onselectCategory: () {
                selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
