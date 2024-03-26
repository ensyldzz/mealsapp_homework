import 'package:flutter/material.dart';
import 'package:mealsapp/data/meal_data.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widgets/meal_card.dart';

class Meals extends StatelessWidget {
  final Category category;
  const Meals({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    List<Meal> mealList =
        meals.where((element) => element.categoryId == category.id).toList();

    Widget widget = ListView.builder(
      itemBuilder: (context, index) => MealCard(meal: mealList[index]),
      itemCount: mealList.length,
    );

    if (mealList.isEmpty) {
      widget = const Center(
        child: Text("Bu kategoride yemek bulunamadı."),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${category.name} Yemekleri"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
        ],
        backgroundColor: category.color,
      ),
      body: Center(child: widget),
    );
  }
}
