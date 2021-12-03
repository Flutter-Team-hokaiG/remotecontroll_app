import 'package:flutter/material.dart';

Widget page2() {
  var controller;
  return Center(
    child: Column(
      children: [
        Container(child: Text('Page2', textScaleFactor: 4), color: Colors.red),
        Expanded(
          child: PageView(
            controller: controller,
            children: <Widget>[
              page3(),
              page4(),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('dataA', textScaleFactor: 2),
            SizedBox(width: 30),
            Text('dataB', textScaleFactor: 2),
          ],
        ),
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
