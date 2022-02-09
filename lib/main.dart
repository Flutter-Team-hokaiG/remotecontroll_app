import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late PageController controller;
  int sliderValue2 = 0;
  int sliderValue1 = 0;
  int _volmax = 5;
  int _volmin = -5;
  List<bool> isSelected = List.generate(3, (index) => false);
  List<bool> isSelected2 = List.generate(2, (index) => false);
  int sliderValue3 = 0;
  int sliderValue4 = 0;
  int sliderValue5 = 0;
  int _eqvolmax = 5;
  int _eqvolmin = -5;
  final _formKey = GlobalKey<FormState>();
  String _nr = '切';
  String _pns = '切';
  String _zan = '切';

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: AppBar(
          backgroundColor: Colors.red,
          automaticallyImplyLeading: false,
          actions: const [],
          elevation: 8,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
            child: GridView(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                childAspectRatio: 2,
              ),
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, -0.5),
                      child: IconButton(
                        iconSize: 50,
                        icon: const Icon(Icons.settings,
                            color: Colors.black, size: 30),
                        onPressed: () {},
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional(0, 0.8),
                      child: Text('通常',
                          style: TextStyle(fontWeight: FontWeight.w800)),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, -0.5),
                      child: IconButton(
                        iconSize: 50,
                        icon: const Icon(Icons.directions_car,
                            color: Colors.black, size: 30),
                        onPressed: () {},
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional(0, 0.8),
                      child: Text('騒がしい',
                          style: TextStyle(fontWeight: FontWeight.w800)),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, -0.5),
                      child: IconButton(
                        iconSize: 50,
                        icon: const Icon(Icons.piano_off,
                            color: Colors.black, size: 30),
                        onPressed: () {},
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional(0, 0.8),
                      child: Text('静か',
                          style: TextStyle(fontWeight: FontWeight.w800)),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, -0.5),
                      child: IconButton(
                        iconSize: 50,
                        icon: const Icon(Icons.local_restaurant,
                            color: Colors.black, size: 30),
                        onPressed: () {},
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional(0, 0.8),
                      child: Text('レストラン',
                          style: TextStyle(fontWeight: FontWeight.w800)),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, -0.5),
                      child: IconButton(
                        iconSize: 50,
                        icon: const Icon(Icons.record_voice_over,
                            color: Colors.black, size: 30),
                        onPressed: () {},
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional(0, 0.8),
                      child: Text('会話',
                          style: TextStyle(fontWeight: FontWeight.w800)),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, -0.5),
                      child: IconButton(
                        iconSize: 50,
                        icon: const Icon(Icons.phone_in_talk,
                            color: Colors.black, size: 30),
                        onPressed: () {},
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional(0, 0.8),
                      child: Text('電話',
                          style: TextStyle(fontWeight: FontWeight.w800)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: 500,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                    child: PageView(
                      controller: controller,
                      onPageChanged: (pageIdx) => controller.animateToPage(
                          pageIdx,
                          duration: const Duration(seconds: 1),
                          curve: Curves.elasticIn),
                      children: <Widget>[
// -------------------------------1page-------------------------------//
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 20, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('左耳', textScaleFactor: 2),
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text('Slider1の値'),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    decoration: const BoxDecoration(),
                                  ),
                                  const Text('右耳', textScaleFactor: 2),
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text('Slider2の値'),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          if (sliderValue1 < _volmax) {
                                            setState(() => sliderValue1++);
                                          }
                                        },
                                        child: Text('大', textScaleFactor: 2),
                                      ),
                                      Expanded(
                                        child: SfSlider.vertical(
                                          activeColor: Colors.amber,
                                          inactiveColor:
                                              const Color(0xFF9E9E9E),
                                          min: _volmin,
                                          max: _volmax,
                                          stepSize: 1,
                                          value: sliderValue1,
                                          onChanged: (newValue) {
                                            setState(
                                                () => sliderValue1 = newValue);
                                          },
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (sliderValue1 > _volmin) {
                                            setState(() => sliderValue1--);
                                          }
                                        },
                                        child: Text('小', textScaleFactor: 2),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    decoration: const BoxDecoration(),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          if (sliderValue2 < _volmax) {
                                            setState(() => sliderValue2++);
                                          }
                                        },
                                        child: Text('大', textScaleFactor: 2),
                                      ),
                                      Expanded(
                                        child: SfSlider.vertical(
                                          activeColor: Colors.amber,
                                          inactiveColor:
                                              const Color(0xFF9E9E9E),
                                          min: _volmin,
                                          max: _volmax,
                                          stepSize: 1,
                                          value: sliderValue2,
                                          onChanged: (newValue) {
                                            setState(
                                                () => sliderValue2 = newValue);
                                          },
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (sliderValue2 > _volmin) {
                                            setState(() => sliderValue2--);
                                          }
                                        },
                                        child: Text('小', textScaleFactor: 2),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.5, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 5, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 20, 0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() => sliderValue1 = 0);
                                          setState(() => sliderValue2 = 0);
                                        },
                                        child: Text('元に戻す'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
// -----------------------------1page_end-----------------------------//
// -------------------------------2page-------------------------------//
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              child: Expanded(
                                child: PageView(
                                  controller: controller,
                                  children: <Widget>[
                                    Center(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SizedBox(height: 50),
                                              ElevatedButton(
                                                onPressed: () {
                                                  if (sliderValue3 <
                                                      _eqvolmax) {
                                                    setState(
                                                        () => sliderValue3++);
                                                  }
                                                },
                                                child: Text('+',
                                                    textScaleFactor: 2),
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  width: 50,
                                                  child: SfSlider.vertical(
                                                    activeColor: Colors.amber,
                                                    inactiveColor:
                                                        const Color(0xFF9E9E9E),
                                                    min: _eqvolmin,
                                                    max: _eqvolmax,
                                                    stepSize: 1,
                                                    value: sliderValue3,
                                                    onChanged: (newValue) {
                                                      setState(() =>
                                                          sliderValue3 =
                                                              newValue);
                                                    },
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  if (sliderValue3 >
                                                      _eqvolmin) {
                                                    setState(
                                                        () => sliderValue3--);
                                                  }
                                                },
                                                child: Text('‐',
                                                    textScaleFactor: 2),
                                              ),
                                              const Text('低',
                                                  textScaleFactor: 1.5),
                                            ],
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                            decoration: const BoxDecoration(),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SizedBox(
                                                  height: 50,
                                                  child: Text('音響調整',
                                                      textScaleFactor: 1.5)),
                                              ElevatedButton(
                                                onPressed: () {
                                                  if (sliderValue4 <
                                                      _eqvolmax) {
                                                    setState(
                                                        () => sliderValue4++);
                                                  }
                                                },
                                                child: Text('+',
                                                    textScaleFactor: 2),
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  width: 50,
                                                  child: SfSlider.vertical(
                                                    activeColor: Colors.amber,
                                                    inactiveColor:
                                                        const Color(0xFF9E9E9E),
                                                    min: _eqvolmin,
                                                    max: _eqvolmax,
                                                    stepSize: 1,
                                                    value: sliderValue4,
                                                    onChanged: (newValue) {
                                                      setState(() =>
                                                          sliderValue4 =
                                                              newValue);
                                                    },
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  if (sliderValue4 >
                                                      _eqvolmin) {
                                                    setState(
                                                        () => sliderValue4--);
                                                  }
                                                },
                                                child: Text('‐',
                                                    textScaleFactor: 2),
                                              ),
                                              const Text('中',
                                                  textScaleFactor: 1.5),
                                            ],
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                            decoration: const BoxDecoration(),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SizedBox(height: 50),
                                              ElevatedButton(
                                                onPressed: () {
                                                  if (sliderValue5 <
                                                      _eqvolmax) {
                                                    setState(
                                                        () => sliderValue5++);
                                                  }
                                                },
                                                child: Text('+',
                                                    textScaleFactor: 2),
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  width: 50,
                                                  child: SfSlider.vertical(
                                                    activeColor: Colors.amber,
                                                    inactiveColor:
                                                        const Color(0xFF9E9E9E),
                                                    min: _eqvolmin,
                                                    max: _eqvolmax,
                                                    stepSize: 1,
                                                    value: sliderValue5,
                                                    onChanged: (newValue) {
                                                      setState(() =>
                                                          sliderValue5 =
                                                              newValue);
                                                    },
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  if (sliderValue5 >
                                                      _eqvolmin) {
                                                    setState(
                                                        () => sliderValue5--);
                                                  }
                                                },
                                                child: Text('‐',
                                                    textScaleFactor: 2),
                                              ),
                                              const Text('高',
                                                  textScaleFactor: 1.5),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
// -------------------------------3page-------------------------------//
                                    Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                '機能調整',
                                                textScaleFactor: 1.5,
                                              )),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              side: BorderSide(
                                                  color: Colors.blue.shade800,
                                                  width: 3),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    content: Form(
                                                      key: _formKey,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                ElevatedButton(
                                                              child: Text("弱"),
                                                              onPressed: () {
                                                                setState(() =>
                                                                    _nr = '弱');
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                ElevatedButton(
                                                              child: Text("中"),
                                                              onPressed: () {
                                                                setState(() =>
                                                                    _nr = '中');
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                ElevatedButton(
                                                              child: Text("強"),
                                                              onPressed: () {
                                                                setState(() =>
                                                                    _nr = '強');
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Text('騒音抑制：$_nr',
                                                textScaleFactor: 2),
                                          ),
                                          SizedBox(height: 50),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              side: BorderSide(
                                                  color: Colors.blue.shade800,
                                                  width: 3),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    content: Form(
                                                      key: _formKey,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                ElevatedButton(
                                                              child: Text("弱"),
                                                              onPressed: () {
                                                                setState(() =>
                                                                    _pns = '弱');
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                ElevatedButton(
                                                              child: Text("中"),
                                                              onPressed: () {
                                                                setState(() =>
                                                                    _pns = '中');
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                ElevatedButton(
                                                              child: Text("強"),
                                                              onPressed: () {
                                                                setState(() =>
                                                                    _pns = '強');
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Text('突発音抑制：$_pns',
                                                textScaleFactor: 2),
                                          ),
                                          SizedBox(height: 50),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              side: BorderSide(
                                                  color: Colors.blue.shade800,
                                                  width: 3),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    content: Form(
                                                      key: _formKey,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                ElevatedButton(
                                                              child: Text("切"),
                                                              onPressed: () {
                                                                setState(() =>
                                                                    _zan = '切');
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                ElevatedButton(
                                                              child: Text("入"),
                                                              onPressed: () {
                                                                setState(() =>
                                                                    _zan = '入');
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Text('残響抑制：$_zan',
                                                textScaleFactor: 2),
                                          ),
                                        ],
                                      ),
                                    ),
// -----------------------------3page_end-----------------------------//
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
// -----------------------------2page_end-----------------------------//
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
