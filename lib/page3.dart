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
  int _eqvolmax = 5;
  int _eqvolmin = -5;

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
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  if (sliderValue3 < _eqvolmax) {
                    setState(() => sliderValue3++);
                  }
                },
                child: Text('+', textScaleFactor: 2),
              ),
              Expanded(
                child: SizedBox(
                  width: 50,
                  child: SfSlider.vertical(
                    activeColor: Colors.amber,
                    inactiveColor: const Color(0xFF9E9E9E),
                    min: _eqvolmin,
                    max: _eqvolmax,
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
                  if (sliderValue3 > _eqvolmin) {
                    setState(() => sliderValue3--);
                  }
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
              SizedBox(height: 50, child: Text('音響調整', textScaleFactor: 1.5)),
              ElevatedButton(
                onPressed: () {
                  if (sliderValue4 < _eqvolmax) {
                    setState(() => sliderValue4++);
                  }
                },
                child: Text('+', textScaleFactor: 2),
              ),
              Expanded(
                child: SizedBox(
                  width: 50,
                  child: SfSlider.vertical(
                    activeColor: Colors.amber,
                    inactiveColor: const Color(0xFF9E9E9E),
                    min: _eqvolmin,
                    max: _eqvolmax,
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
                  if (sliderValue4 > _eqvolmin) {
                    setState(() => sliderValue4--);
                  }
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
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  if (sliderValue5 < _eqvolmax) {
                    setState(() => sliderValue5++);
                  }
                },
                child: Text('+', textScaleFactor: 2),
              ),
              Expanded(
                child: SizedBox(
                  width: 50,
                  child: SfSlider.vertical(
                    activeColor: Colors.amber,
                    inactiveColor: const Color(0xFF9E9E9E),
                    min: _eqvolmin,
                    max: _eqvolmax,
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
                  if (sliderValue5 > _eqvolmin) {
                    setState(() => sliderValue5--);
                  }
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
