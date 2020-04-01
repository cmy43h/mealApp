import 'package:flutter/material.dart';

import '../widgets/mainDrawer.dart';

class FilterScreen extends StatefulWidget {
  static const routName = '/filterscreen';
  final Function saveFilter;
  final Map<String, bool> currentFilters;

  FilterScreen(this.saveFilter, this.currentFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFree = widget.currentFilters['glutenFree'];
    _lactoseFree = widget.currentFilters['lactoseFree'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filtered Screen',
          style: TextStyle(
            fontFamily: 'ProductSans',
            fontSize: 23,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final _selectedFilters = {
                  'glutenFree': _glutenFree,
                  'lactoseFree': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilter(_selectedFilters);
              }),
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SwitchListTile(
            value: _glutenFree,
            onChanged: (value) {
              setState(() {
                _glutenFree = value;
              });
            },
            title: Text('Gluten Free'),
          ),
          SwitchListTile(
            value: _lactoseFree,
            onChanged: (value) {
              setState(() {
                _lactoseFree = value;
              });
            },
            title: Text('Lactose Free'),
          ),
          SwitchListTile(
            value: _vegan,
            onChanged: (value) {
              setState(() {
                _vegan = value;
              });
            },
            title: Text('Vegan'),
          ),
          SwitchListTile(
            value: _vegetarian,
            onChanged: (value) {
              setState(() {
                _vegetarian = value;
              });
            },
            title: Text('Vegetarian'),
          )
        ],
      )),
    );
  }
}
