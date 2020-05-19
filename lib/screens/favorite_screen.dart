import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;
  //final Function toggleFavorites;

  FavoriteScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    return favoriteMeal.isEmpty
        ? Center(
            child: Text("You have no favorites yet - start adding some!"),
          )
        :ListView.builder(itemBuilder: (ctx,index){
          return MealItem(affordability: favoriteMeal[index].affordability,
          complexity: favoriteMeal[index].complexity,
          duration: favoriteMeal[index].duration,
          id: favoriteMeal[index].id,
          title: favoriteMeal[index].title,
          url: favoriteMeal[index].imageUrl,);
        },itemCount: favoriteMeal.length,);
  }
}
