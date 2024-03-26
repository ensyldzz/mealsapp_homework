import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mealsapp/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final void Function() onCategoryClick;
  const CategoryCard(
      {super.key, required this.category, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCategoryClick();
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            category.color.withOpacity(1),
            category.color.withOpacity(0.5)
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 1, color: const Color.fromARGB(255, 40, 36, 36)),
        ),
        child: Text(
          category.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
