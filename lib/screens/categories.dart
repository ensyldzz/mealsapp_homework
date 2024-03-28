import 'package:flutter/material.dart';
import 'package:mealsapp/data/category_data.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/widgets/category_card.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  void _changeScreen(Category c, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Meals(
          category: c,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Category> categoryList = categories;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kategoriler",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 186, 139, 255),
      ),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 2),
        children: categoryList
            .map((e) => CategoryCard(
                  category: e,
                  onCategoryClick: () {
                    _changeScreen(e, context);
                  },
                ))
            .toList(),
      ),
    );
  }
}
