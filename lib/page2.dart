import 'package:flutter/material.dart';
import 'page3.dart';
import 'page4.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<bool> isSelected = List.generate(3, (index) => false);
  List<bool> isSelected2 = List.generate(2, (index) => false);

  @override
  Widget build(BuildContext context) {
    var controller;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: Expanded(
              child: PageView(
                controller: controller,
                children: <Widget>[
                  Page3(),
                  Page4(),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: const BoxDecoration(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleButtons(
                highlightColor: Colors.lightBlue,
                color: Colors.blueGrey[200],
                borderRadius: BorderRadius.circular(20),
                borderColor: Colors.blueGrey[200],
                borderWidth: 3,
                selectedBorderColor: Colors.lightBlue,
                disabledColor: Colors.grey[800],
                isSelected: isSelected,
                children: const <Widget>[
                  Icon(Icons.chevron_left),
                  Icon(Icons.swap_horizontal_circle_outlined),
                  Icon(Icons.chevron_right),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0;
                        buttonIndex < isSelected.length;
                        buttonIndex++) {
                      if (buttonIndex == index) {
                        isSelected[buttonIndex] = true;
                      } else {
                        isSelected[buttonIndex] = false;
                      }
                    }
                  });
                },
              ),
              SizedBox(width: 100),
              ToggleButtons(
                highlightColor: Colors.redAccent,
                fillColor: Colors.red[200],
                color: Colors.red[200],
                borderRadius: BorderRadius.circular(20),
                borderColor: Colors.red[200],
                borderWidth: 3,
                selectedBorderColor: Colors.redAccent,
                disabledColor: Colors.grey[800],
                isSelected: isSelected2,
                children: const <Widget>[
                  Icon(Icons.sensors),
                  Icon(Icons.sensors_off),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0;
                        buttonIndex < isSelected2.length;
                        buttonIndex++) {
                      if (buttonIndex == index) {
                        isSelected2[buttonIndex] = true;
                      } else {
                        isSelected2[buttonIndex] = false;
                      }
                    }
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
