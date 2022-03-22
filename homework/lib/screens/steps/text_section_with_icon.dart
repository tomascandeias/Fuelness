// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';

class TextSectionWithIcon extends StatelessWidget {
  final int iconCode;
  final String _title;
  final String _body;
  static const double _hpad = 16;

  TextSectionWithIcon(this.iconCode, this._title, this._body);

  /* @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Icon(IconData(iconCode, fontFamily: 'MaterialIcons')),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(_hpad * 1.5, 0, 0, _hpad * 2),
            child: Text(_title, style: Theme.of(context).textTheme.titleMedium),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: _hpad * 2),
            child: Text(_body, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ),
      ],
    );
  } */
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Container(
        margin: EdgeInsets.all(20),
        child: Table(
          defaultColumnWidth: FixedColumnWidth(100.0),
          children: [
            TableRow(children: [
              Column(children: [
                const SizedBox(
                  height: 5,
                ),
                Icon(IconData(iconCode, fontFamily: 'MaterialIcons'))
              ]),
              Column(children: [
                Text(_title, style: Theme.of(context).textTheme.titleMedium),
              ]),
              Column(children: [
                const SizedBox(
                  height: 5,
                ),
                Text(_body, style: Theme.of(context).textTheme.bodyMedium),
              ]),
            ]),
          ],
        ),
      ),
    ]));
  }
}
