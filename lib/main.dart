import 'package:flutter/material.dart';
import 'package:meal_planner/data/original.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meal_screen.dart';
import 'models/meal.dart';

void main() => runApp(Main());

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  Map<String, bool> _mapFilters = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
    'lactose': false
  };

  List<Meal> _mealData = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _applyFilters(Map<String, bool> filter) {
    setState(() {
      _mapFilters = filter;

      _mealData = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && _mapFilters['gluten']) return false;
        if (!meal.isLactoseFree && _mapFilters['lactose']) return false;
        if (!meal.isVegan && _mapFilters['vegan']) return false;
        if (!meal.isVegetarian && _mapFilters['vegetarian']) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String id) {
    final existingId = _favoriteMeals.indexWhere((meal) => meal.id == id);
    print("Existing Id : ${existingId}");
    if (existingId >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingId);
      });
    } else {
      _favoriteMeals.add(_mealData.firstWhere((meal) => meal.id == id));
    }
    //print(_favoriteMeals.length);
    //print(_favoriteMeals[0].id);
  }

  bool _isFavorite(String id)
{
  if(_favoriteMeals.any((meal)=>meal.id == id))
      return true;
    return false;

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Meal App",
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(29, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontFamily: 'RobertoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              subtitle: TextStyle(
                fontFamily: 'RobertoCondensed',
                fontSize: 16,
              )),
        ),
        // home: TabsScreen(),
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabsScreen(_favoriteMeals),
          CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(_mealData),
          MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(_toggleFavorite,_isFavorite),
          FiltersScreen.routeName: (ctx) =>
              FiltersScreen(_applyFilters, _mapFilters),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => TabsScreen(_favoriteMeals));
        });
  }
}
