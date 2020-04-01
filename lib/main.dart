import 'package:flutter/material.dart';

import './dummyData.dart';
import './model/meal.dart';
import './screen/categoryMealsScreen.dart';
import './screen/category_screen.dart';
import './screen/mealDetailScreen.dart';
import './screen/tabScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;

  /*Map<String, bool> _filters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegan': false,
    'vegetarian': false
  };*/
  List<Map<String, dynamic>> _filters = [
    {'title': 'Gluten Free', 'value': false},
    {'title': 'Lactose Free', 'value': false},
    {'title': 'Vegan', 'value': false},
    {'title': 'Vegetarian', 'value': false}
  ];

  void getFilter(List<Map<String, dynamic>> _filterData) {
    /*print(_filterData[0]['value'].toString() +
        " " +
        _filterData[1]['value'].toString() +
        " " +
        _filterData[2]['value'].toString() +
        " " +
        _filterData[3]['value'].toString());*/

    setState(() {
      _filters = _filterData;
      _availableMeals = DUMMY_MEALS.where((test) {
        if (_filters[0]['value'] && !test.isGlutenFree) {
          return false;
        }
        if (_filters[1]['value'] && !test.isLactoseFree) {
          return false;
        }
        if (_filters[2]['value'] && !test.isVegan) {
          return false;
        }
        if (_filters[3]['value'] && !test.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.purpleAccent,
        brightness: Brightness.light,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                  fontFamily: 'ProductSans',
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
      ),
      //home: CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(_filters, getFilter),
        CategoryMealSscreen.routeName: (ctx) =>
            CategoryMealSscreen(_availableMeals),
        MealDetailScreen.routName: (ctx) => MealDetailScreen(),
        //FilterScreen.routName: (ctx) => FilterScreen()
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
    );
  }
}
