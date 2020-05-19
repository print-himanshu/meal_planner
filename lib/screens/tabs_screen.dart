import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorite_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {

  //final Function _toggleFavorites;
  final List<Meal> _favoriteMeal;

  TabsScreen(this._favoriteMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  /* Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
        title: const Text("Meal App"),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.category,),text: "Category",),
            Tab(icon: Icon(Icons.favorite,),text: "Favorite",),
          ],
        ),
      ),body:TabBarView(children: <Widget>[
        CategoriesScreen(),
        FavoriteScreen(),

      ],)),

    );
  }*/
  int _selectedIndex = 0;

   List<Map<String, Object>> _pages = [];

   @override
   void initState()
   {
     _pages =    [
    {'page': CategoriesScreen(), 'title': "Category"},
    {'page': FavoriteScreen(widget._favoriteMeal), 'title': 'Favorite'}
  ];

   }


  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${_pages[_selectedIndex]['title']}",
        ),
      ),
      body: _pages[_selectedIndex]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedIndex,
          onTap:_selectPage,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.category,
              ),
              title: Text(
                "Category",
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.favorite,
              ),
              title: Text(
                "Favorite",
              ),
            )
          ]),
    );
  }
}
