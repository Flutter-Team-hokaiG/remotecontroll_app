import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int sliderValue2 = 0;
  int sliderValue1 = 0;
  int _volmax = 5;
  int _volmin = -5;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('左耳', textScaleFactor: 2),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text('Slider1の値'),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: const BoxDecoration(),
                ),
                const Text('右耳', textScaleFactor: 2),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                        inactiveColor: const Color(0xFF9E9E9E),
                        min: _volmin,
                        max: _volmax,
                        stepSize: 1,
                        value: sliderValue1,
                        onChanged: (newValue) {
                          setState(() => sliderValue1 = newValue);
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
                    // StreamBuilder<List<TestRecord>>(
                    //   stream: queryTestRecord(
                    //     singleRecord: true,
                    //   ),
                    //   builder: (context, snapshot) {
                    //     // Customize what your widget looks like when it's loading.
                    //     if (!snapshot.hasData) {
                    //       return const Center(
                    //         child: SizedBox(
                    //           width: 30,
                    //           height: 30,
                    //           child:
                    //               CircularProgressIndicator(
                    //             color: Color(0xFFE0C334),
                    //           ),
                    //         ),
                    //       );
                    //     }
                    //     List<TestRecord>
                    //         toggleIconTestRecordList =
                    //         snapshot.data;
                    //     // Return an empty Container when the document does not exist.
                    //     if (snapshot.data!.isEmpty) {
                    //       return Container();
                    //     }
                    //     final toggleIconTestRecord =
                    //         toggleIconTestRecordList
                    //                 .isNotEmpty
                    //             ? toggleIconTestRecordList
                    //                 .first
                    //             : null;
                    //     return ToggleIcon(
                    //       onPressed: () async {
                    //         final testUpdateData =
                    //             createTestRecordData(
                    //           aaa:
                    //               !toggleIconTestRecord.aaa,
                    //         );
                    //         await toggleIconTestRecord
                    //             .reference
                    //             .update(testUpdateData);
                    //       },
                    //       value: toggleIconTestRecord.aaa,
                    //       onIcon: const Icon(
                    //         Icons.volume_up,
                    //         color: Colors.black,
                    //         size: 40,
                    //       ),
                    //       offIcon: const Icon(
                    //         Icons.volume_off,
                    //         color: Color(0xFF9E9E9E),
                    //         size: 40,
                    //       ),
                    //     );
                    //   },
                    // ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
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
                        inactiveColor: const Color(0xFF9E9E9E),
                        min: _volmin,
                        max: _volmax,
                        stepSize: 1,
                        value: sliderValue2,
                        onChanged: (newValue) {
                          setState(() => sliderValue2 = newValue);
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
                    // StreamBuilder<List<TestRecord>>(
                    //   stream: queryTestRecord(
                    //     singleRecord: true,
                    //   ),
                    //   builder: (context, snapshot) {
                    //     // Customize what your widget looks like when it's loading.
                    //     if (!snapshot.hasData) {
                    //       return const Center(
                    //         child: SizedBox(
                    //           width: 30,
                    //           height: 30,
                    //           child:
                    //               CircularProgressIndicator(
                    //             color: Color(0xFFE0C334),
                    //           ),
                    //         ),
                    //       );
                    //     }
                    //     List? toggleIconTestRecordList =
                    //         snapshot.data;
                    //     // Return an empty Container when the document does not exist.
                    //     if (snapshot.data!.isEmpty) {
                    //       return Container();
                    //     }
                    //     final toggleIconTestRecord =
                    //         toggleIconTestRecordList
                    //                 .isNotEmpty
                    //             ? toggleIconTestRecordList!
                    //                 .first
                    //             : null;
                    //     return ToggleIcon(
                    //       onPressed: () async {
                    //         final testUpdateData =
                    //             createTestRecordData(
                    //           aaa:
                    //               !toggleIconTestRecord.aaa,
                    //         );
                    //         await toggleIconTestRecord
                    //             .reference
                    //             .update(testUpdateData);
                    //       },
                    //       value: toggleIconTestRecord.aaa,
                    //       onIcon: const Icon(
                    //         Icons.volume_up,
                    //         color: Colors.black,
                    //         size: 40,
                    //       ),
                    //       offIcon: const Icon(
                    //         Icons.volume_off,
                    //         color: Color(0xFF9E9E9E),
                    //         size: 40,
                    //       ),
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.5, 0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    // child: StreamBuilder<List<TestRecord>>(
                    //   stream: queryTestRecord(
                    //     singleRecord: true,
                    //   ),
                    //   builder: (context, snapshot) {
                    //     // Customize what your widget looks like when it's loading.
                    //     if (!snapshot.hasData) {
                    //       return const Center(
                    //         child: SizedBox(
                    //           width: 30,
                    //           height: 30,
                    //           child:
                    //               CircularProgressIndicator(
                    //             color: Color(0xFFE0C334),
                    //           ),
                    //         ),
                    //       );
                    //     }
                    //     List<TestRecord>
                    //         toggleIconTestRecordList =
                    //         snapshot.data;
                    //     // Return an empty Container when the document does not exist.
                    //     if (snapshot.data!.isEmpty) {
                    //       return Container();
                    //     }
                    //     final toggleIconTestRecord =
                    //         toggleIconTestRecordList
                    //                 .isNotEmpty
                    //             ? toggleIconTestRecordList
                    //                 .first
                    //             : null;
                    //     return ToggleIcon(
                    //       onPressed: () async {
                    //         final testsElement =
                    //             FFAppState()
                    //                 .mute
                    //                 .toString();
                    //         final testsUpdate =
                    //             toggleIconTestRecord.tests
                    //                     .toList()
                    //                     .contains(
                    //                         testsElement)
                    //                 ? FieldValue
                    //                     .arrayRemove(
                    //                         [testsElement])
                    //                 : FieldValue.arrayUnion(
                    //                     [testsElement]);
                    //         final testUpdateData = {
                    //           'tests': testsUpdate,
                    //         };
                    //         await toggleIconTestRecord
                    //             .reference
                    //             .update(testUpdateData);
                    //       },
                    //       value: toggleIconTestRecord.tests
                    //           .toList()
                    //           .contains(FFAppState().mute),
                    //       onIcon: const Icon(
                    //         Icons.looks_one_outlined,
                    //         color: Colors.black,
                    //         size: 40,
                    //       ),
                    //       offIcon: const Icon(
                    //         Icons.looks_two_outlined,
                    //         color: Colors.black,
                    //         size: 40,
                    //       ),
                    //     );
                    //   },
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
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
    );
  }
}
