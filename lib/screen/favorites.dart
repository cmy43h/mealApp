import 'package:flutter/material.dart';

import '../model/meal.dart';
import '../widgets/mealItem.dart';

class Favorites extends StatelessWidget {
  final List<Meal> _favouriteScreen;

  Favorites([this._favouriteScreen]);

  @override
  Widget build(BuildContext context) {
    if (_favouriteScreen.isEmpty) {
      return Center(child: Text("Favorites"));
    }
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          id: _favouriteScreen[index].id,
          title: _favouriteScreen[index].title,
          imageUrl: _favouriteScreen[index].imageUrl,
          duration: _favouriteScreen[index].duration,
          complexity: _favouriteScreen[index].complexity,
          affordability: _favouriteScreen[index].affordability,
        );
      },
      itemCount: _favouriteScreen.length,
    );
  }
}
