import 'package:flutter/material.dart';
import '../data/original.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {

bool initialFlag = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final availableHeight = mediaQuery.size.height -
        mediaQuery.padding.top;

    return Container(
        height: availableHeight,
        child: GridView.count(
          children: DUMMY_CATEGORIES
              .map(
                (item) => CategoryItem(
                  title: item.title,
                  color: item.color,
                  id: item.id,
                ),
              )
              .toList(),
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          padding: const EdgeInsets.all(25),
        ),

    );
  }
}
