import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../screen/categoryMealsScreen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String image;

  CategoryItem(this.title, this.id, this.color, this.image);

  void selectCategory(context) {
    Navigator.of(context).pushNamed(CategoryMealSscreen.routeName,
        arguments: {'id': id, 'title': title, 'iamge': image});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      child: CachedNetworkImage(
        imageUrl: image,
        imageBuilder: (context, imageProvider) => Container(
          child: Center(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w300),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              )),
        ),
        placeholder: (context, url) => Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
          child: SizedBox(
            child: CircularProgressIndicator(),
            height: 50,
            width: 50,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}

//       image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
