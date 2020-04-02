import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListTile(
      BuildContext context, IconData icon, String title, Function _tapHandler) {
    return ListTile(
      onTap: _tapHandler,
      leading: Icon(
        icon,
        color: Colors.black54,
        size: 25,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Cooking Up',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: Colors.white),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.withOpacity(0.6), Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
          ),
          _buildListTile(context, Icons.restaurant_menu, 'Meal', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          SizedBox(
            height: 2,
          ),
          /*_buildListTile(context, Icons.settings, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routName);
          })*/
        ],
      ),
    );
  }
}
