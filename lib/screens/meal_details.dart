import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetails extends StatelessWidget {
  final Meal meal;
  const MealDetails({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${meal.name} İçindekiler"),
      ),
      body: Column(
        children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Text(
            meal.name,
            style: const TextStyle(
              height: 2,
              fontWeight: FontWeight.w500,
              color: Colors.red,
              fontSize: 16,
            ),
          ),
          const Divider(
            thickness: 1,
            color: Color.fromARGB(255, 75, 71, 71),
          ),
          Text("İçindekiler: ${meal.ingredients}")
        ],
      ),
    );
  }
}
