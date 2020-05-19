import 'package:flutter/material.dart';
import 'package:meal_planner/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildDrawerWidget(
      String title, IconData icon, Function pressedMethod) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Colors.black87,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      onTap: pressedMethod,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildDrawerWidget('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildDrawerWidget('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName,);
          }),
        ],
      ),
    );
  }
}
