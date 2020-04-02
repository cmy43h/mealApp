import 'package:flutter/material.dart';

import './category_screen.dart';
import './favorites.dart';
import '../model/meal.dart';
import '../widgets/bottomModalScreen.dart';
import '../widgets/mainDrawer.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
  final List<Map<String, Object>> _currentFilterOption;
  final Function _saveFilter;
  final List<Meal> _favouriteScreen;

  TabScreen(this._currentFilterOption, this._saveFilter, this._favouriteScreen);
}

class _TabScreenState extends State<TabScreen> {
  /* bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;*/

  /*bool _isFilterDataUnchanged = true;*/

  /*@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _switchOption = widget._currentFilterOption;
  }
*/
  /* Map<String, bool> _switchOptions = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegan': false,
    'vegetarian': false
  };
*/
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      {'page': CategoryScreen(), 'title': 'Category'},
      {'page': Favorites(widget._favouriteScreen), 'title': 'Favourites'}
    ];
  }

/*  Widget _switchBuilder(BuildContext context, String _title, bool _value) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        print(_title + " " + _value.toString());
        return SwitchListTile(
          title: Text(_title),
          value: _value,
          onChanged: (val) {
            setState(() {
              _value = val;
            });
          },
        );
      },
    );
  }*/

  void _showBottomSheet(
      BuildContext context, List<Map<String, dynamic>> _currentFilterOption) {
    showModalBottomSheet(
        isDismissible: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
        ),
        context: context,
        builder: (ctx) {
          return ShowBottomModalSheet(widget._saveFilter, _currentFilterOption);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style:
              Theme.of(context).textTheme.title.copyWith(color: Colors.white),
        ),
        //  backgroundColor: Colors.purple[600],
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton(
              onPressed: () =>
                  _showBottomSheet(context, widget._currentFilterOption),
              child: Icon(
                Icons.filter_list,
                color: Colors.white,
              ),
            )
          : null,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        child: BottomAppBar(
          child: BottomNavigationBar(
            onTap: _selectPage,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                title: Text("Category"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                title: Text("Favorites"),
              )
            ],
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white70,
            selectedItemColor: Colors.white,
            currentIndex: _selectedPageIndex,
          ),
        ),
      ),
    );
  }
}
