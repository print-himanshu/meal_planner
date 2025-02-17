import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  //bool returnedFlag;

  CategoryItem({
    @required this.color,
    @required this.title,
    @required this.id,
    //@required this.returnedFlag,
  }) {
    //print("Category Item Constructor");
  }

  void selectCategory(BuildContext ctx) {
    /*Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return CategoryMealScreen(
            id: id,
            title: title,
          );
        },
      ),
    );*/

    Navigator.of(ctx).pushNamed(
      CategoryMealScreen.routeName,
      arguments: id
    ).then((argument)
    {
     // returnedFlag = argument;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(title, style: Theme.of(context).textTheme.title),
      ),
    );
  }
}
