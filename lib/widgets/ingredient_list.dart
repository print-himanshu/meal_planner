import 'package:flutter/material.dart';

class IngredientList extends StatelessWidget {
  final mealDetailData;
  final partitionHeight;
  final partitionWidth;

  IngredientList({
    @required this.mealDetailData,
    @required this.partitionHeight,
    @required this.partitionWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: partitionHeight,
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                "Ingredients",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Card(
              elevation: 3,
              child: Container(
                height: partitionHeight * 0.8,
                width: partitionWidth * 0.75,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).accentColor),
                        child: Text(mealDetailData.ingredients[index],
                            style: Theme.of(context).textTheme.subtitle));
                  },
                  itemCount: mealDetailData.ingredients.length,
                ),
              ),
            ),
          ],
        ));
  }
}
