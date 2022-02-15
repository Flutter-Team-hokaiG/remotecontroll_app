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
  int _memory = 0;
  List<int> initialValue = [16, 16, 16, 16, 16, 16];
  List<int> sliderValue1 = [16, 16, 16, 16, 16, 16];
  List<int> sliderValue2 = [16, 16, 16, 16, 16, 16];
  int _volmax = 32;
  int _volmin = 0;
  // List<bool> isSelected1 = List.generate(3, (index) => false);
  // List<bool> isSelected2 = List.generate(2, (index) => false);
  List<bool> isSelected1 = [false, true, false];
  List<bool> isSelected2 = [true, false];
  List<int> sliderValue3 = [0, 0, 0, 0, 0, 0];
  List<int> sliderValue4 = [0, 0, 0, 0, 0, 0];
  List<int> sliderValue5 = [0, 0, 0, 0, 0, 0];
  int _eqvolmax = 5;
  int _eqvolmin = -5;
  final _formKey = GlobalKey<FormState>();
  List<String> _nr = ['切', '切', '切', '切', '切', '切'];
  List<String> _pns = ['切', '切', '切', '切', '切', '切'];
  List<String> _zan = ['切', '切', '切', '切', '切', '切'];

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void popupMenuSelected(selectedMenu) {
    switch (selectedMenu) {
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return const SettingPage1();
          }),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return const SettingPage2();
          }),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: const Text('リモコンApp'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.account_box_rounded, size: 30),
            onSelected: popupMenuSelected, //実行される関数名
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: 1, //valueを設定
                child: Text('困ったときは'),
              ),
              const PopupMenuItem(
                value: 2, //valueを設定
                child: Text('装用効果確認'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Text('メモリ：$_memory'),
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
                        icon: Icon(Icons.settings,
                            color: _memory == 0 ? Colors.red : Colors.black,
                            size: 30),
                        onPressed: () {
                          setState(() => _memory = 0);
                        },
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
                        icon: Icon(Icons.directions_car,
                            color: _memory == 1 ? Colors.red : Colors.black,
                            size: 30),
                        onPressed: () {
                          setState(() => _memory = 1);
                        },
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
                        icon: Icon(Icons.piano_off,
                            color: _memory == 2 ? Colors.red : Colors.black,
                            size: 30),
                        onPressed: () {
                          setState(() => _memory = 2);
                        },
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
                        icon: Icon(Icons.local_restaurant,
                            color: _memory == 3 ? Colors.red : Colors.black,
                            size: 30),
                        onPressed: () {
                          setState(() => _memory = 3);
                        },
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
                        icon: Icon(Icons.record_voice_over,
                            color: _memory == 4 ? Colors.red : Colors.black,
                            size: 30),
                        onPressed: () {
                          setState(() => _memory = 4);
                        },
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
                        icon: Icon(Icons.phone_in_talk,
                            color: _memory == 5 ? Colors.red : Colors.black,
                            size: 30),
                        onPressed: () {
                          setState(() => _memory = 5);
                        },
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
                                  Spacer(flex: 6),
                                  const Text('左耳', textScaleFactor: 2),
                                  Spacer(flex: 1),
                                  Text(sliderValue1[_memory].toString(),
                                      textScaleFactor: 2.5),
                                  Spacer(flex: 6),
                                  const Text('右耳', textScaleFactor: 2),
                                  Spacer(flex: 1),
                                  Text(sliderValue2[_memory].toString(),
                                      textScaleFactor: 2.5),
                                  Spacer(flex: 6),
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
                                          if (sliderValue1[_memory] < _volmax) {
                                            setState(
                                                () => sliderValue1[_memory]++);
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
                                          value: sliderValue1[_memory],
                                          onChanged: (newValue) {
                                            setState(() =>
                                                sliderValue1[_memory] =
                                                    newValue);
                                          },
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (sliderValue1[_memory] > _volmin) {
                                            setState(
                                                () => sliderValue1[_memory]--);
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
                                          if (sliderValue2[_memory] < _volmax) {
                                            setState(
                                                () => sliderValue2[_memory]++);
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
                                          value: sliderValue2[_memory],
                                          onChanged: (newValue) {
                                            setState(() =>
                                                sliderValue2[_memory] =
                                                    newValue);
                                          },
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (sliderValue2[_memory] > _volmin) {
                                            setState(
                                                () => sliderValue2[_memory]--);
                                          }
                                        },
                                        child: Text('小', textScaleFactor: 2),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      sliderValue1 = initialValue;
                                      sliderValue2 = initialValue;
                                    });
                                  },
                                  child: Text('元に戻す'),
                                ),
                                SizedBox(width: 20),
                              ],
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
                                                  if (sliderValue3[_memory] <
                                                      _eqvolmax) {
                                                    setState(() => sliderValue3[
                                                        _memory]++);
                                                  }
                                                },
                                                child: Text('+',
                                                    textScaleFactor: 2),
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  width: 100,
                                                  child: Row(
                                                    children: [
                                                      SfSlider.vertical(
                                                        activeColor:
                                                            Colors.blue,
                                                        inactiveColor:
                                                            const Color(
                                                                0xFF9E9E9E),
                                                        min: _eqvolmin,
                                                        max: _eqvolmax,
                                                        stepSize: 1,
                                                        value: sliderValue3[
                                                            _memory],
                                                        onChanged: (newValue) {
                                                          setState(() =>
                                                              sliderValue3[
                                                                      _memory] =
                                                                  newValue);
                                                        },
                                                      ),
                                                      SfSlider.vertical(
                                                        activeColor: Colors.red,
                                                        inactiveColor:
                                                            const Color(
                                                                0xFF9E9E9E),
                                                        min: _eqvolmin,
                                                        max: _eqvolmax,
                                                        stepSize: 1,
                                                        value: sliderValue3[
                                                            _memory],
                                                        onChanged: (newValue) {
                                                          setState(() =>
                                                              sliderValue3[
                                                                      _memory] =
                                                                  newValue);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  if (sliderValue3[_memory] >
                                                      _eqvolmin) {
                                                    setState(() => sliderValue3[
                                                        _memory]--);
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
                                                0.05,
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
                                                  if (sliderValue4[_memory] <
                                                      _eqvolmax) {
                                                    setState(() => sliderValue4[
                                                        _memory]++);
                                                  }
                                                },
                                                child: Text('+',
                                                    textScaleFactor: 2),
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  width: 100,
                                                  child: Row(
                                                    children: [
                                                      SfSlider.vertical(
                                                        activeColor:
                                                            Colors.blue,
                                                        inactiveColor:
                                                            const Color(
                                                                0xFF9E9E9E),
                                                        min: _eqvolmin,
                                                        max: _eqvolmax,
                                                        stepSize: 1,
                                                        value: sliderValue4[
                                                            _memory],
                                                        onChanged: (newValue) {
                                                          setState(() =>
                                                              sliderValue4[
                                                                      _memory] =
                                                                  newValue);
                                                        },
                                                      ),
                                                      SfSlider.vertical(
                                                        activeColor: Colors.red,
                                                        inactiveColor:
                                                            const Color(
                                                                0xFF9E9E9E),
                                                        min: _eqvolmin,
                                                        max: _eqvolmax,
                                                        stepSize: 1,
                                                        value: sliderValue4[
                                                            _memory],
                                                        onChanged: (newValue) {
                                                          setState(() =>
                                                              sliderValue4[
                                                                      _memory] =
                                                                  newValue);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  if (sliderValue4[_memory] >
                                                      _eqvolmin) {
                                                    setState(() => sliderValue4[
                                                        _memory]--);
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
                                                0.05,
                                            decoration: const BoxDecoration(),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SizedBox(height: 50),
                                              ElevatedButton(
                                                onPressed: () {
                                                  if (sliderValue5[_memory] <
                                                      _eqvolmax) {
                                                    setState(() => sliderValue5[
                                                        _memory]++);
                                                  }
                                                },
                                                child: Text('+',
                                                    textScaleFactor: 2),
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  width: 100,
                                                  child: Row(
                                                    children: [
                                                      SfSlider.vertical(
                                                        activeColor:
                                                            Colors.blue,
                                                        inactiveColor:
                                                            const Color(
                                                                0xFF9E9E9E),
                                                        min: _eqvolmin,
                                                        max: _eqvolmax,
                                                        stepSize: 1,
                                                        value: sliderValue5[
                                                            _memory],
                                                        onChanged: (newValue) {
                                                          setState(() =>
                                                              sliderValue5[
                                                                      _memory] =
                                                                  newValue);
                                                        },
                                                      ),
                                                      SfSlider.vertical(
                                                        activeColor: Colors.red,
                                                        inactiveColor:
                                                            const Color(
                                                                0xFF9E9E9E),
                                                        min: _eqvolmin,
                                                        max: _eqvolmax,
                                                        stepSize: 1,
                                                        value: sliderValue5[
                                                            _memory],
                                                        onChanged: (newValue) {
                                                          setState(() =>
                                                              sliderValue5[
                                                                      _memory] =
                                                                  newValue);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  if (sliderValue5[_memory] >
                                                      _eqvolmin) {
                                                    setState(() => sliderValue5[
                                                        _memory]--);
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
                                              _showDialogNR();
                                            },
                                            child: Text('騒音抑制：${_nr[_memory]}',
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
                                              _showDialogPNS();
                                            },
                                            child: Text(
                                                '突発音抑制：${_pns[_memory]}',
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
                                              _showDialogZAN();
                                            },
                                            child: Text('残響抑制：${_zan[_memory]}',
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
                                  isSelected: isSelected1,
                                  children: const <Widget>[
                                    Icon(Icons.chevron_left),
                                    Icon(Icons.settings_ethernet_sharp),
                                    Icon(Icons.chevron_right),
                                  ],
                                  onPressed: (int index) {
                                    setState(() {
                                      for (int buttonIndex = 0;
                                          buttonIndex < isSelected1.length;
                                          buttonIndex++) {
                                        if (buttonIndex == index) {
                                          isSelected1[buttonIndex] = true;
                                        } else {
                                          isSelected1[buttonIndex] = false;
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

  _showDialogNR() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(20),
          title: Text("騒音抑制"),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      child: Text("切"),
                      onPressed: () {
                        setState(() => _nr[_memory] = '切');
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      child: Text("弱1"),
                      onPressed: () {
                        setState(() => _nr[_memory] = '弱1');
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      child: Text("弱2"),
                      onPressed: () {
                        setState(() => _nr[_memory] = '弱2');
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      child: Text("弱3"),
                      onPressed: () {
                        setState(() => _nr[_memory] = '弱3');
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      child: Text("中1"),
                      onPressed: () {
                        setState(() => _nr[_memory] = '中1');
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      child: Text("中2"),
                      onPressed: () {
                        setState(() => _nr[_memory] = '中2');
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      child: Text("強1"),
                      onPressed: () {
                        setState(() => _nr[_memory] = '強1');
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      child: Text("強2"),
                      onPressed: () {
                        setState(() => _nr[_memory] = '強2');
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _showDialogPNS() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("突発音抑制"),
          content: Form(
            key: _formKey,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  child: Text("切"),
                  onPressed: () {
                    setState(() => _pns[_memory] = '切');
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: Text("弱"),
                  onPressed: () {
                    setState(() => _pns[_memory] = '弱');
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: Text("中"),
                  onPressed: () {
                    setState(() => _pns[_memory] = '中');
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: Text("強"),
                  onPressed: () {
                    setState(() => _pns[_memory] = '強');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _showDialogZAN() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("残響抑制"),
          content: Form(
            key: _formKey,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  child: Text("切"),
                  onPressed: () {
                    setState(() => _zan[_memory] = '切');
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: Text("入"),
                  onPressed: () {
                    setState(() => _zan[_memory] = '入');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SettingPage1 extends StatelessWidget {
  const SettingPage1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('困ったときは')),
      body: Center(child: Icon(Icons.info_outline, size: 100)),
    );
  }
}

// サードページ(遷移先)
class SettingPage2 extends StatelessWidget {
  const SettingPage2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('装用効果確認')),
      body: Center(child: Icon(Icons.tour_outlined, size: 100)),
    );
  }
}
