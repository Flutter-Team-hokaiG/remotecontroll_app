import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  int sliderValue3 = 0;
  int sliderValue4 = 0;
  int sliderValue5 = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                onPressed: () {
                  // print('Button pressed ...');
                },
                child: Text('+', textScaleFactor: 2),
              ),
              Expanded(
                child: SizedBox(
                  width: 50,
                  child: SfSlider.vertical(
                    activeColor: Colors.amber,
                    inactiveColor: const Color(0xFF9E9E9E),
                    min: -5,
                    max: 5,
                    stepSize: 1,
                    value: sliderValue3,
                    onChanged: (newValue) {
                      setState(() => sliderValue3 = newValue);
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // print('Button pressed ...');
                },
                child: Text('‐', textScaleFactor: 2),
              ),
              const Text('低', textScaleFactor: 1.5),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.1,
            decoration: const BoxDecoration(),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                onPressed: () {
                  // print('Button pressed ...');
                },
                child: Text('+', textScaleFactor: 2),
              ),
              Expanded(
                child: SizedBox(
                  width: 50,
                  child: SfSlider.vertical(
                    activeColor: Colors.amber,
                    inactiveColor: const Color(0xFF9E9E9E),
                    min: -5,
                    max: 5,
                    stepSize: 1,
                    value: sliderValue4,
                    onChanged: (newValue) {
                      setState(() => sliderValue4 = newValue);
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // print('Button pressed ...');
                },
                child: Text('‐', textScaleFactor: 2),
              ),
              const Text('中', textScaleFactor: 1.5),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.1,
            decoration: const BoxDecoration(),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                onPressed: () {
                  // print('Button pressed ...');
                },
                child: Text('+', textScaleFactor: 2),
              ),
              Expanded(
                child: SizedBox(
                  width: 50,
                  child: SfSlider.vertical(
                    activeColor: Colors.amber,
                    inactiveColor: const Color(0xFF9E9E9E),
                    min: -5,
                    max: 5,
                    stepSize: 1,
                    value: sliderValue5,
                    onChanged: (newValue) {
                      setState(() => sliderValue5 = newValue);
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // print('Button pressed ...');
                },
                child: Text('‐', textScaleFactor: 2),
              ),
              const Text('高', textScaleFactor: 1.5),
            ],
          ),
        ],
      ),
    );
  }
}
