import 'package:flutter/material.dart';
import 'package:meal_planner/widgets/ingredient_list.dart';
import 'package:meal_planner/widgets/steps_list.dart';
import '../data/original.dart';

class MealDetailsScreen extends StatefulWidget {
  static const routeName = "/meal-details";

  final Function toggleFavorites;
  final Function isFavorite;
  bool initialFlag = true;
  

  MealDetailsScreen(this.toggleFavorites, this.isFavorite);

  @override
  _MealDetailsScreenState createState() => _MealDetailsScreenState();
}


class _MealDetailsScreenState extends State<MealDetailsScreen> {

      IconData favoriteIcon ;

    void changeIcon(String id)
    {
      setState(() {
        //print("Inside changeIcon method");
        widget.isFavorite(id)
                          ? favoriteIcon = Icons.favorite
                          : favoriteIcon = Icons.favorite_border;

      //print("favorite Icon : ${favoriteIcon}");
      });
    }
  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments as String;

    final mealDetailData =
        DUMMY_MEALS.firstWhere((meal) => meal.id == id, orElse: null);

    final appBar = AppBar(
      title: Text(mealDetailData.title),
    );

    final mediaQuery = MediaQuery.of(context);

    final partitionHeight = (mediaQuery.size.height -
            appBar.preferredSize.height -
            mediaQuery.padding.top) /
        3;

    Widget settingInitialIcon()
    {
              return Icon(widget.isFavorite(id)
                          ? favoriteIcon = Icons.favorite
                          : favoriteIcon = Icons.favorite_border);
    }


    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              mealDetailData.imageUrl,
              width: mediaQuery.size.width,
              height: partitionHeight,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IngredientList(
                      mealDetailData: mealDetailData,
                      partitionHeight: partitionHeight,
                      partitionWidth: mediaQuery.size.width),
                  Align(
                    alignment: Alignment.center,
                    child: FloatingActionButton(
                      heroTag: 'delete',
                      child: Icon(Icons.delete),
                      onPressed: () {
                        Navigator.of(context).pop([id, 'remove']);
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  StepsList(
                      mealDetailData: mealDetailData,
                      partitionHeight: partitionHeight,
                      partitionWidth: mediaQuery.size.width,
                      id: id),
                  Align(
                    alignment: Alignment.center,
                    child: FloatingActionButton(
                      child: widget.initialFlag? settingInitialIcon() :  Icon(favoriteIcon),
                      heroTag: 'favorite',
                      onPressed: () {
                        changeIcon(id);
                        widget.toggleFavorites(id);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
