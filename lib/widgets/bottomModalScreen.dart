import 'package:flutter/material.dart';

class ShowBottomModalSheet extends StatefulWidget {
  @override
  _ShowBottomModalSheetState createState() => _ShowBottomModalSheetState();
  final List<Map<String, dynamic>> _currentFilterOption;
  final Function _saveFilter;

  ShowBottomModalSheet(this._saveFilter, this._currentFilterOption);
}

class _ShowBottomModalSheetState extends State<ShowBottomModalSheet> {
  bool _isFilterDataUnchanged = true;
  List<Map<String, dynamic>> _switchOption = [
    {'title': 'Gluten Free', 'value': false},
    {'title': 'Lactose Free', 'value': false},
    {'title': 'Vegan', 'value': false},
    {'title': 'Vegetarian', 'value': false}
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _switchOption = widget._currentFilterOption;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 320,
        child: Column(children: <Widget>[
          Container(
            height: 250,
            margin: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              children: _switchOption
                  .map((f) => StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          /* print(_title + " " + _value.toString());*/
                          return SwitchListTile(
                            title: Text(f['title'],
                                style: TextStyle(
                                  fontFamily: 'ProductSans',
                                  fontSize: 18,
                                )),
                            value: f['value'],
                            onChanged: (val) {
                              setState(() {
                                f['value'] = val;
                                _isFilterDataUnchanged = false;
                              });
                            },
                          );
                        },
                      ))
                  .toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  if (!_isFilterDataUnchanged) {
                    List<Map<String, dynamic>> _selectedSwitchOption = [
                      {
                        'title': 'Gluten Free',
                        'value': _switchOption[0]['value']
                      },
                      {
                        'title': 'Lactose Free',
                        'value': _switchOption[1]['value']
                      },
                      {'title': 'Vegan', 'value': _switchOption[2]['value']},
                      {
                        'title': 'Vegetarian',
                        'value': _switchOption[3]['value']
                      }
                    ];
                    print(_switchOption[0]['value'].toString() +
                        _switchOption[1]['value'].toString() +
                        _switchOption[2]['value'].toString() +
                        _switchOption[3]['value'].toString());

                    widget._saveFilter(_selectedSwitchOption);
                    setState(() {
                      _isFilterDataUnchanged = true;
                    });
                    Navigator.of(context).pop();
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                  child: Text(
                    'Save Filter',
                    style: TextStyle(
                        fontFamily: 'ProductSans',
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                color: Colors.purple,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  if (_isFilterDataUnchanged) {
                    Navigator.of(context).pop();
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        fontFamily: 'ProductSans',
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ]));
  }
}
