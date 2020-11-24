import 'package:flutter/material.dart';

Widget normalAppBar() {
  return AppBar(
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('SASA- '),
        Text(
          'NEWS',
          style: TextStyle(color: Colors.orange),
        ),
      ],
    ),
    elevation: 12,
  );
}

Widget specificAppBar() {
  return AppBar(
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('SASA- '),
        Text(
          'NEWS',
          style: TextStyle(color: Colors.orange),
        ),
      ],
    ),
    actions: <Widget>[
      Opacity(
        opacity: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Icon(Icons.description),
        ),
      ),
    ],
    elevation: 0,
  );
}
