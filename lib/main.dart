import 'dart:math';
import 'dart:ui';

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
  List<int> initialValue = [16, 16, 16, 16, 16, 16]; // [元に戻す]の値
  List<int> sliderValue1 = [16, 16, 16, 16, 16, 16]; // メインボリューム左
  List<int> sliderValue2 = [16, 16, 16, 16, 16, 16]; // メインボリューム右
  int _volmax = 32; // メインボリューム最大
  int _volmin = 0; // メインボリューム最小
  // List<bool> isSelected1 = List.generate(3, (index) => false);
  // List<bool> isSelected2 = List.generate(2, (index) => false);
  List<bool> isSelected1 = [false, true, false]; // 片耳・両耳ボタン
  List<bool> isSelected2 = [true, false]; // ミュート用ボタン
  // ↓ 微調整ボリューム低域・中域・高域（最初の6つが左、後ろの6つが右）
  List<int> sliderValueb1 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; // 低域
  List<int> sliderValueb2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; // 中域
  List<int> sliderValueb3 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; // 高域
  int _eqvolmax = 5; // 微調整ボリューム最大
  int _eqvolmin = -5; // 微調整ボリューム最小
  final _formKey = GlobalKey<FormState>();
  List<String> _nr = ['切', '切', '切', '切', '切', '切']; // 微調整NR
  List<String> _pns = ['切', '切', '切', '切', '切', '切']; // 微調整PNS
  List<String> _zan = ['切', '切', '切', '切', '切', '切']; // 微調整残響抑制

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
      case 1: // SettingPage1へ移動
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return const SettingPage1();
          }),
        );
        break;
      case 2: // SettingPage2へ移動
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return const SettingPage2();
          }),
        );
        break;
      case 3: // SettingPage2へ移動
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return const SettingPage3();
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
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return EditPage1(
                    memory: _memory,
                    sliderValue1: sliderValue1,
                    sliderValue2: sliderValue2,
                    sliderValueb1: sliderValueb1,
                    sliderValueb2: sliderValueb2,
                    sliderValueb3: sliderValueb3,
                    nr: _nr,
                    pns: _pns,
                    zan: _zan,
                  );
                }),
              );
            },
            icon: Icon(Icons.menu)),
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
              const PopupMenuItem(
                value: 3, //valueを設定
                child: Text('補聴器を探す'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Text('メモリ：${_memory + 1}'),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
            child: GridView(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                childAspectRatio: MediaQuery.of(context).size.width / 220,
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
                        iconSize: 30,
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
                        iconSize: 30,
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
                        iconSize: 30,
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
                        iconSize: 30,
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
                        iconSize: 30,
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
                        iconSize: 30,
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
                                          inactiveColor: Colors.grey[400],
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
                                          inactiveColor: Colors.grey[400],
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
                                          _ediSlider1(),
                                          SizedBox(width: 10),
                                          _ediSlider2(),
                                          SizedBox(width: 10),
                                          _ediSlider3(),
                                        ],
                                      ),
                                    ),
// -------------------------------3page-------------------------------//
                                    Center(child: (() {
                                      if (isSelected2[1] == true) {
                                        return _digitalMute();
                                      } else {
                                        return Column(
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
                                              child: Text(
                                                  '騒音抑制：${_nr[_memory]}',
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
                                              child: Text(
                                                  '残響抑制：${_zan[_memory]}',
                                                  textScaleFactor: 2),
                                            ),
                                          ],
                                        );
                                      }
                                    })()),
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

  _ediSlider1() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {
            if (isSelected1[2] == true || isSelected2[1] == true) {
            } else {
              if (sliderValueb1[_memory] < _eqvolmax) {
                setState(() => sliderValueb1[_memory]++);
              }
            }
            if (isSelected1[0] == true || isSelected2[1] == true) {
            } else {
              if (sliderValueb1[_memory + 6] < _eqvolmax) {
                setState(() => sliderValueb1[_memory + 6]++);
              }
            }
          },
          child: Text('+', textScaleFactor: 2),
        ),
        Expanded(
          child: SizedBox(
            width: 100,
            child: Row(
              children: [
                Container(
                  child: (() {
                    if (isSelected1[2] == true || isSelected2[1] == true) {
                      return SfSlider.vertical(
                        min: _eqvolmin,
                        max: _eqvolmax,
                        stepSize: 1,
                        showTicks: true,
                        interval: 1,
                        value: sliderValueb1[_memory],
                        onChanged: null,
                      );
                    } else {
                      return SfSlider.vertical(
                        activeColor: Colors.blue,
                        inactiveColor: Colors.grey[400],
                        min: _eqvolmin,
                        max: _eqvolmax,
                        stepSize: 1,
                        showTicks: true,
                        interval: 1,
                        value: sliderValueb1[_memory],
                        onChanged: (newValue) {
                          setState(() => sliderValueb1[_memory] = newValue);
                        },
                      );
                    }
                  })(),
                ),
                Container(
                  child: (() {
                    if (isSelected1[0] == true || isSelected2[1] == true) {
                      return SfSlider.vertical(
                        min: _eqvolmin,
                        max: _eqvolmax,
                        stepSize: 1,
                        showTicks: true,
                        interval: 1,
                        value: sliderValueb1[_memory + 6],
                        onChanged: null,
                      );
                    } else {
                      return SfSlider.vertical(
                        activeColor: Colors.red,
                        inactiveColor: Colors.grey[400],
                        min: _eqvolmin,
                        max: _eqvolmax,
                        stepSize: 1,
                        showTicks: true,
                        interval: 1,
                        value: sliderValueb1[_memory + 6],
                        onChanged: (newValue) {
                          setState(() => sliderValueb1[_memory + 6] = newValue);
                        },
                      );
                    }
                  })(),
                ),
              ],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (isSelected1[2] == true || isSelected2[1] == true) {
            } else {
              if (sliderValueb1[_memory] > _eqvolmin) {
                setState(() => sliderValueb1[_memory]--);
              }
            }
            if (isSelected1[0] == true || isSelected2[1] == true) {
            } else {
              if (sliderValueb1[_memory + 6] > _eqvolmin) {
                setState(() => sliderValueb1[_memory + 6]--);
              }
            }
          },
          child: Text('‐', textScaleFactor: 2),
        ),
        const Text('低', textScaleFactor: 1.5),
      ],
    );
  }

  _ediSlider2() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 50, child: Text('音響調整', textScaleFactor: 1.5)),
        ElevatedButton(
          onPressed: () {
            if (isSelected1[2] == true || isSelected2[1] == true) {
            } else {
              if (sliderValueb2[_memory] < _eqvolmax) {
                setState(() => sliderValueb2[_memory]++);
              }
            }
            if (isSelected1[0] == true || isSelected2[1] == true) {
            } else {
              if (sliderValueb2[_memory + 6] < _eqvolmax) {
                setState(() => sliderValueb2[_memory + 6]++);
              }
            }
          },
          child: Text('+', textScaleFactor: 2),
        ),
        Expanded(
          child: SizedBox(
            width: 100,
            child: Row(
              children: [
                Container(
                  child: (() {
                    if (isSelected1[2] == true || isSelected2[1] == true) {
                      return SfSlider.vertical(
                        min: _eqvolmin,
                        max: _eqvolmax,
                        stepSize: 1,
                        showTicks: true,
                        interval: 1,
                        value: sliderValueb2[_memory],
                        onChanged: null,
                      );
                    } else {
                      return SfSlider.vertical(
                        activeColor: Colors.blue,
                        inactiveColor: Colors.grey[400],
                        min: _eqvolmin,
                        max: _eqvolmax,
                        stepSize: 1,
                        showTicks: true,
                        interval: 1,
                        value: sliderValueb2[_memory],
                        onChanged: (newValue) {
                          setState(() => sliderValueb2[_memory] = newValue);
                        },
                      );
                    }
                  })(),
                ),
                Container(
                  child: (() {
                    if (isSelected1[0] == true || isSelected2[1] == true) {
                      return SfSlider.vertical(
                        min: _eqvolmin,
                        max: _eqvolmax,
                        stepSize: 1,
                        showTicks: true,
                        interval: 1,
                        value: sliderValueb2[_memory + 6],
                        onChanged: null,
                      );
                    } else {
                      return SfSlider.vertical(
                        activeColor: Colors.red,
                        inactiveColor: Colors.grey[400],
                        min: _eqvolmin,
                        max: _eqvolmax,
                        stepSize: 1,
                        showTicks: true,
                        interval: 1,
                        value: sliderValueb2[_memory + 6],
                        onChanged: (newValue) {
                          setState(() => sliderValueb2[_memory + 6] = newValue);
                        },
                      );
                    }
                  })(),
                ),
              ],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (isSelected1[2] == true || isSelected2[1] == true) {
            } else {
              if (sliderValueb2[_memory] > _eqvolmin) {
                setState(() => sliderValueb2[_memory]--);
              }
            }
            if (isSelected1[0] == true || isSelected2[1] == true) {
            } else {
              if (sliderValueb2[_memory + 6] > _eqvolmin) {
                setState(() => sliderValueb2[_memory + 6]--);
              }
            }
          },
          child: Text('‐', textScaleFactor: 2),
        ),
        const Text('中', textScaleFactor: 1.5),
      ],
    );
  }

  _ediSlider3() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {
            if (isSelected1[2] == true || isSelected2[1] == true) {
            } else {
              if (sliderValueb3[_memory] < _eqvolmax) {
                setState(() => sliderValueb3[_memory]++);
              }
            }
            if (isSelected1[0] == true || isSelected2[1] == true) {
            } else {
              if (sliderValueb3[_memory + 6] < _eqvolmax) {
                setState(() => sliderValueb3[_memory + 6]++);
              }
            }
          },
          child: Text('+', textScaleFactor: 2),
        ),
        Expanded(
          child: SizedBox(
            width: 100,
            child: Row(
              children: [
                Container(
                  child: (() {
                    if (isSelected1[2] == true || isSelected2[1] == true) {
                      return SfSlider.vertical(
                        min: _eqvolmin,
                        max: _eqvolmax,
                        stepSize: 1,
                        showTicks: true,
                        interval: 1,
                        value: sliderValueb3[_memory],
                        onChanged: null,
                      );
                    } else {
                      return SfSlider.vertical(
                        activeColor: Colors.blue,
                        inactiveColor: Colors.grey[400],
                        min: _eqvolmin,
                        max: _eqvolmax,
                        stepSize: 1,
                        showTicks: true,
                        interval: 1,
                        value: sliderValueb3[_memory],
                        onChanged: (newValue) {
                          setState(() => sliderValueb3[_memory] = newValue);
                        },
                      );
                    }
                  })(),
                ),
                Container(
                  child: (() {
                    if (isSelected1[0] == true || isSelected2[1] == true) {
                      return SfSlider.vertical(
                        min: _eqvolmin,
                        max: _eqvolmax,
                        stepSize: 1,
                        showTicks: true,
                        interval: 1,
                        value: sliderValueb3[_memory + 6],
                        onChanged: null,
                      );
                    } else {
                      return SfSlider.vertical(
                        activeColor: Colors.red,
                        inactiveColor: Colors.grey[400],
                        min: _eqvolmin,
                        max: _eqvolmax,
                        stepSize: 1,
                        showTicks: true,
                        interval: 1,
                        value: sliderValueb3[_memory + 6],
                        onChanged: (newValue) {
                          setState(() => sliderValueb3[_memory + 6] = newValue);
                        },
                      );
                    }
                  })(),
                ),
              ],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (isSelected1[2] == true || isSelected2[1] == true) {
            } else {
              if (sliderValueb3[_memory] > _eqvolmin) {
                setState(() => sliderValueb3[_memory]--);
              }
            }
            if (isSelected1[0] == true || isSelected2[1] == true) {
            } else {
              if (sliderValueb3[_memory + 6] > _eqvolmin) {
                setState(() => sliderValueb3[_memory + 6]--);
              }
            }
          },
          child: Text('‐', textScaleFactor: 2),
        ),
        const Text('高', textScaleFactor: 1.5),
      ],
    );
  }

  _digitalMute() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
            alignment: Alignment.topCenter,
            child: Text(
              '機能調整',
              textScaleFactor: 1.5,
            )),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            return null;
          },
          child: Text('騒音抑制：${_nr[_memory]}', textScaleFactor: 2),
        ),
        SizedBox(height: 50),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            return null;
          },
          child: Text('突発音抑制：${_pns[_memory]}', textScaleFactor: 2),
        ),
        SizedBox(height: 50),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            return null;
          },
          child: Text('残響抑制：${_zan[_memory]}', textScaleFactor: 2),
        ),
      ],
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

class EditPage1 extends StatelessWidget {
  final int memory;
  final List<int> sliderValue1;
  final List<int> sliderValue2;
  final List<int> sliderValueb1;
  final List<int> sliderValueb2;
  final List<int> sliderValueb3;
  final List<String> nr;
  final List<String> pns;
  final List<String> zan;
  const EditPage1({
    Key? key,
    required this.memory,
    required this.sliderValue1,
    required this.sliderValue2,
    required this.sliderValueb1,
    required this.sliderValueb2,
    required this.sliderValueb3,
    required this.nr,
    required this.pns,
    required this.zan,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('パラメータ確認')),
      body: Center(
        child: ListView(
          children: <Widget>[
            Text("選択中のメモリ：${memory + 1}\n"),
            for (var i = 0; i < 6; i++)
              Text(
                  "メモリ${i + 1}　　左${sliderValue1[i]}　右${sliderValue2[i]}\n　微調整　　低域：左${sliderValueb1[i]} 右${sliderValueb1[i + 5]}　中域：左${sliderValueb2[i]} 右${sliderValueb2[i + 5]}　高域：左${sliderValueb3[i]} 右${sliderValueb3[i + 5]}\n　機能　　　雑音抑制：${nr[i]}　突発音抑制：${pns[i]}　残響抑制：${zan[i]}"),
          ],
        ),
      ),
    );
  }
}

class SettingPage1 extends StatefulWidget {
  const SettingPage1({Key? key}) : super(key: key);
  @override
  State<SettingPage1> createState() => _SettingPage1State();
}

class _SettingPage1State extends State<SettingPage1> {
  String _score = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('困ったときは')),
      body: Column(
        children: [
          Container(child: Text("$_score", textScaleFactor: 3), height: 200),
          Row(
            children: [
              Spacer(),
              FloatingActionButton(
                shape: RoundedRectangleBorder(),
                onPressed: () {
                  setState(() => _score = _score + "左");
                },
                child: Icon(Icons.arrow_left, size: 40),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    shape: RoundedRectangleBorder(),
                    onPressed: () {
                      setState(() => _score = _score + "上");
                    },
                    child: Icon(Icons.arrow_drop_up, size: 40),
                  ),
                  SizedBox(height: 60),
                  FloatingActionButton(
                    shape: RoundedRectangleBorder(),
                    onPressed: () {
                      setState(() => _score = _score + "下");
                    },
                    child: Icon(Icons.arrow_drop_down, size: 40),
                  ),
                ],
              ),
              FloatingActionButton(
                  shape: RoundedRectangleBorder(),
                  onPressed: () {
                    setState(() => _score = _score + "右");
                  },
                  child: Icon(Icons.arrow_right, size: 40)),
              Spacer(),
              FloatingActionButton(
                  onPressed: () {
                    setState(() => _score = _score + "Y");
                  },
                  child: Text('Y', textScaleFactor: 2.5)),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                      onPressed: () {
                        setState(() => _score = _score + "X");
                      },
                      child: Text('X', textScaleFactor: 2.5)),
                  SizedBox(height: 40),
                  FloatingActionButton(
                      onPressed: () {
                        setState(() => _score = _score + "B");
                      },
                      child: Text('B', textScaleFactor: 2.5)),
                ],
              ),
              FloatingActionButton(
                  onPressed: () {
                    setState(() => _score = _score + "A");
                  },
                  child: Text('A', textScaleFactor: 2.5)),
              Spacer(),
            ],
          ),
          Container(
            height: 200,
            child: (() {
              if (_score == '上上下下左右左右BA') {
                return Center(child: Text("コナミコマンド！！", textScaleFactor: 3));
              }
            })(),
          ),
        ],
      ),
    );
  }
}

class SettingPage2 extends StatefulWidget {
  const SettingPage2({Key? key}) : super(key: key);
  @override
  State<SettingPage2> createState() => _SettingPage2State();
}

class _SettingPage2State extends State<SettingPage2> {
  // int _countFlower = 1;
  int _checkcount = 0;

  List<bool> isSelected = List.generate(3, (index) => false);
  final random = Random();
  double get randomValue => (random.nextDouble() * 2) - 1;
  List<CheckBoxListTileModel> checkBoxListTileModel =
      CheckBoxListTileModel.getUsers();
  final List<int> _selectedIndex = [];

  void itemChange(bool val, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = val;
      if (_selectedIndex.contains(index)) {
        _selectedIndex.remove(index);
      } else {
        _selectedIndex.add(index); // 選択されたらリストに追加する
      }
      if (_selectedIndex.isEmpty) {
        _checkcount = 0;
        return;
      }
      _checkcount = _selectedIndex.length; // 合計値を計算
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('装用効果確認'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: Stack(fit: StackFit.expand, children: <Widget>[
              Image.asset('assets/image/haikei.jpg', fit: BoxFit.fill),
              Align(
                alignment: Alignment((_checkcount / 7) * 1.8 - 1, 0.6),
                child: (() {
                  if (_checkcount < 5) {
                    return Image.asset('assets/image/walk_girl_walk.png',
                        scale: 2.7);
                  } else if (_checkcount < 7) {
                    return Image.asset('assets/image/smartphone_girl_walk.png',
                        scale: 3);
                  } else {
                    return Image.asset('assets/image/school_randoseru_girl.png',
                        scale: 3);
                  }
                })(),
              ),
              Image.asset('assets/image/flower.jpg', fit: BoxFit.fill),
            ]),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: checkBoxListTileModel.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        CheckboxListTile(
                          activeColor: Colors.lime,
                          dense: true,
                          title: Text(
                            checkBoxListTileModel[index].title,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 4,
                                decoration: checkBoxListTileModel[index].isCheck
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none),
                          ),
                          value: checkBoxListTileModel[index].isCheck,
                          onChanged: (bool? val) {
                            itemChange(val!, index);
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SettingPage3 extends StatefulWidget {
  const SettingPage3({Key? key}) : super(key: key);
  @override
  _SettingPage3State createState() => _SettingPage3State();
}

class _SettingPage3State extends State<SettingPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('補聴器を探す')),
      body: Column(
        children: [
          Expanded(
            child: Image.asset('assets/image/map.jpg'),
          ),
        ],
      ),
    );
  }
}

class CheckBoxListTileModel {
  int userId;
  String title;
  bool isCheck;

  CheckBoxListTileModel(
      {required this.userId, required this.title, required this.isCheck});

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(userId: 1, title: "補聴器をつけた？", isCheck: false),
      CheckBoxListTileModel(userId: 2, title: "補聴器をつけて会話した？", isCheck: false),
      CheckBoxListTileModel(userId: 3, title: "補聴器をつけてお出かけした？", isCheck: false),
      CheckBoxListTileModel(userId: 4, title: "補聴器をつけてテレビを見た？", isCheck: false),
      CheckBoxListTileModel(userId: 5, title: "補聴器のボリュームを変えた？", isCheck: false),
      CheckBoxListTileModel(userId: 6, title: "補聴器のメモリを変えた？", isCheck: false),
      CheckBoxListTileModel(userId: 7, title: "補聴器の微調整を変えた？", isCheck: false),
    ];
  }
}
