import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/fitters-screen';

  final Function applyFilters;
  Map<String, bool> _filters;

  FiltersScreen(this.applyFilters, this._filters);

  @override
  _FiltersScreenState createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget buildSwitch(
      String title, String subtitle, bool variable, Function changeFunciton) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(
        subtitle,
      ),
      value: variable,
      onChanged: changeFunciton,
    );
  }

  bool _gluten;
  bool _vegetarian;
  bool _vegan;
  bool _lactose;

  @override
  void initState() {
    super.initState();
    
    _gluten = widget._filters['gluten'];
    _vegetarian = widget._filters['vegetarian'];
    _vegan = widget._filters['vegan'];
    _lactose = widget._filters['lactose'];

    print("Gluten Value : ${_gluten}");
    print("Vegetarian Value : ${_vegetarian}");
    print("Vegan Value : ${_vegan}");
    print("Lactose Value : ${_lactose}");
  }

  @override
  Widget build(BuildContext context) {
    void _updateFilter() {
      widget._filters = {
        'gluten': _gluten,
        'vegetarian': _vegetarian,
        'vegan': _vegan,
        'lactose': _lactose
      };
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Filters",
        ),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitch("is Gluten Free", "Only include gluten-free meals.",
                    _gluten, (newValue) {
                  setState(() {
                    //print("Old glutenFlag: ${widget._glutenFree}");
                    _gluten = newValue;
                    //print("New glutenFlag: ${widget._glutenFree}");
                  });
                }),
                buildSwitch("is Vegetarian", "Only include vegetarian meals.",
                    _vegetarian, (newValue) {
                  setState(() {
                    //print("Old vegatarianFlag: ${widget._vegetarian}");
                    _vegetarian = newValue;
                    //print("New vegetarianFlag: ${widget._vegetarian}");
                  });
                }),
                buildSwitch("is Vegan", "Only include vegan meals.", _vegan,
                    (newValue) {
                  setState(() {
                    //print("Old veganFlag: ${widget._vegan}");
                    _vegan = newValue;
                    //print("New veganFlag: ${widget._vegan}");
                  });
                }),
                buildSwitch(
                    "is Lactose Free",
                    "Only include gluten-free meals.",
                    widget._filters['lactose'], (newValue) {
                  setState(() {
                    //print("Old lactoseFlag: ${widget._lactoseFree}");
                    _lactose = newValue;
                    //print("New lactoseFlag: ${widget._lactoseFree}");
                  });
                }),
              ],
            ),
          ),
          FloatingActionButton(
            child: Icon(Icons.save, size: 30),
            onPressed: () {
              _updateFilter();
              widget.applyFilters(widget._filters);
              Navigator.of(context).pushReplacementNamed('/');
            },
          )
        ],
      ),
    );
  }
}
