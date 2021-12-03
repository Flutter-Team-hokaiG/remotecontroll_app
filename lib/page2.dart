import 'package:flutter/material.dart';

Widget page2() {
  var controller;
  return Center(
    child: Column(
      children: [
        Text('dataC', textScaleFactor: 2),
        Expanded(
          child: PageView(
            controller: controller,
            children: <Widget>[
              page3(),
              page4(),
            ],
          ),
        ),
        Text('dataD', textScaleFactor: 2),
      ],
    ),
  );
}

Widget page3() {
  return Center(
    child: Container(
      child: Text(
        'Page3',
        style: TextStyle(fontSize: 50.0),
      ),
    ),
  );
}

Widget page4() {
  return Center(
    child: Container(
      child: Text(
        'Page4',
        style: TextStyle(fontSize: 50.0),
      ),
    ),
  );
}
