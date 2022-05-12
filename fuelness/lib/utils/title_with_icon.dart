// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';

class TitleWithIcon extends StatelessWidget {
  final int iconCode;
  final String _title;
  final String units;
  static const double _hpad = 16;

  TitleWithIcon(this.iconCode, this._title, this.units);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Container(
        margin: EdgeInsets.all(10),
        child: Table(
          defaultColumnWidth: FixedColumnWidth(110.0),
          children: [
            TableRow(children: [
              Column(children: [
                const SizedBox(
                  height: 5,
                ),
                Icon(IconData(iconCode, fontFamily: 'MaterialIcons'))
              ]),
              Column(children: [
                Text(_title, style: TextStyle(fontWeight: FontWeight.w200, fontSize: 30)),
              ]),
              Column(children: [
                Text(units, style: TextStyle(fontWeight: FontWeight.w200, fontSize: 30))
              ])
            ]),
          ],
        ),
      ),
    ]));
  }
}
