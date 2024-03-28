import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/providers/favorites_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetails extends ConsumerStatefulWidget {
  final Meal meal;
  const MealDetails({Key? key, required this.meal}) : super(key: key);

  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends ConsumerState<MealDetails> {
  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(FavoriteMealsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.name),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(FavoriteMealsProvider.notifier)
                  .toggleMealFavorite(widget.meal);
            },
            icon: Icon(favorites.contains(widget.meal)
                ? Icons.favorite
                : Icons.favorite_border),
          )
        ],
      ),
      body: Column(
        children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(widget.meal.imageUrl),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Text(
            widget.meal.name,
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
          Text("İçindekiler: ${widget.meal.ingredients}")
        ],
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:mealsapp/models/meal.dart';
// import 'package:transparent_image/transparent_image.dart';

// class MealDetails extends StatefulWidget {
//   final Meal meal;
//   const MealDetails({super.key, required this.meal});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("${meal.name} İçindekiler"),
//       ),
//       body: Column(
//         children: [
//           FadeInImage(
//             placeholder: MemoryImage(kTransparentImage),
//             image: NetworkImage(meal.imageUrl),
//             fit: BoxFit.cover,
//             height: 200,
//             width: double.infinity,
//           ),
//           Text(
//             meal.name,
//             style: const TextStyle(
//               height: 2,
//               fontWeight: FontWeight.w500,
//               color: Colors.red,
//               fontSize: 16,
//             ),
//           ),
//           const Divider(
//             thickness: 1,
//             color: Color.fromARGB(255, 75, 71, 71),
//           ),
//           Text("İçindekiler: ${meal.ingredients}")
//         ],
//       ),
//     );
//   }
// }
