import 'package:flutter/material.dart';
import '../data/original.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const String routeName = '/category-meals';
  
  final List<Meal> _availableMeal ;

  //final Function toggleFavorites;

  CategoryMealScreen(this._availableMeal);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  final appBar = AppBar(
    title: Text("The Recipes"),
  );

  List<Meal> _categoryMeal;
  bool initialFlag = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!initialFlag) {
      final _id = ModalRoute.of(context).settings.arguments as String;
      _categoryMeal = widget._availableMeal.where((meal) {
        return meal.categories.contains(_id);
      }).toList();

      initialFlag = true;
    }
  }

  void _removeMeal(String returnId)
  {
    setState(() {
      _categoryMeal.removeWhere((test)=> test.id == returnId);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: _categoryMeal[index].id,
              affordability:_categoryMeal[index].affordability,
              complexity:_categoryMeal[index].complexity,
              duration: _categoryMeal[index].duration,
              title: _categoryMeal[index].title,
              url: _categoryMeal[index].imageUrl,
              removeMeal: _removeMeal,
              //toggleFavorites: widget.toggleFavorites,
            );
          },
          itemCount: _categoryMeal.length,
        ));
  }
}
