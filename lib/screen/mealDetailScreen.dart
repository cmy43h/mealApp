import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../dummyData.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFavouriteState;
  final Function isFavourite;

  const MealDetailScreen({Key key, this.toggleFavouriteState, this.isFavourite})
      : super(key: key);
  static const routName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    Widget buildSectionTitle(BuildContext context, text) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    Widget buildSectionData(queries) {
      return Container(
        height: 200,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10, left: 40, right: 40),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.purple),
            borderRadius: BorderRadius.circular(15)),
        child: ListView.builder(
          itemBuilder: (ctx, index) => Card(
            child: Container(
              child: Text('${index + 1}.\t\t' + queries[index]),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            ),
          ),
          itemCount: queries.length,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () => toggleFavouriteState(mealId),
              child: isFavourite(mealId)
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
            ),
          )
        ],
        title: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              selectedMeal.title,
              overflow: TextOverflow.fade,
              style: TextStyle(fontFamily: 'ProductSans', fontSize: 23),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: selectedMeal.imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                  child: SizedBox(
                    child: CircularProgressIndicator(),
                    height: 50,
                    width: 50,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildSectionData(selectedMeal.ingredients),
            buildSectionTitle(context, 'Steps'),
            buildSectionData(selectedMeal.steps),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
