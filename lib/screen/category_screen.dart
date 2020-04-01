import 'package:flutter/material.dart';

import '../dummyData.dart';
import '../widgets/categoryItem.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15),
      children: DUMMY_CATEGORIES
          .map((catData) => CategoryItem(
              catData.title, catData.id, catData.color, catData.image))
          .toList(),
    );
  }
}
