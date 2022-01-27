import 'package:flutter/material.dart';
import 'page3.dart';
// import 'page4.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    var controller;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
            child: Text('音響調整', textScaleFactor: 2),
          ),
          Expanded(
            child: PageView(
              controller: controller,
              children: <Widget>[
                Page3(),
                page4(),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: const BoxDecoration(),
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
}
