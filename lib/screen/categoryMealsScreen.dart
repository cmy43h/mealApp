import 'package:flutter/material.dart';

import '../model/meal.dart';
import '../widgets/mealItem.dart';

class CategoryMealSscreen extends StatefulWidget {
  /* final String title;
  final String id;
  const CategoryMealSscreen(this.title, this.id); */
  static const routeName = '/category-mealScreen';
  final List<Meal> _availableMeal;

  CategoryMealSscreen(this._availableMeal);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealSscreen> {
  String _categoryTitle;
  List<Meal> _categoryMeals;
  bool _isDataInitiated = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!_isDataInitiated) {
      final routeArgument =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final _categoryId = routeArgument['id'];
      _categoryTitle = routeArgument['title'];
      _categoryMeals = widget._availableMeal.where((meal) {
        return meal.categories.contains(_categoryId);
      }).toList();
    }
    _isDataInitiated = true;
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      _categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          _categoryTitle,
          style: TextStyle(fontFamily: 'ProductSans', fontSize: 23),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _categoryMeals[index].id,
            title: _categoryMeals[index].title,
            imageUrl: _categoryMeals[index].imageUrl,
            duration: _categoryMeals[index].duration,
            complexity: _categoryMeals[index].complexity,
            affordability: _categoryMeals[index].affordability,
            removeItem: removeMeal,
          );
        },
        itemCount: _categoryMeals.length,
      ),
    );
  }
}
