import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Color color;
  final String name;
  const CategoryCard({super.key, required this.color, required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint("$name Tıklandı");
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(1), color.withOpacity(0.5)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 1, color: const Color.fromARGB(255, 40, 36, 36)),
        ),
        child: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
