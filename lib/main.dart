import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';

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
                        color: Colors.deepOrange,
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional(0, 0.8),
                      child: Text(
                        '通常',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, -0.5),
                      child: IconButton(
                        iconSize: 50,
                        icon: const Icon(
                          Icons.directions_car,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional(0, 0.8),
                      child: Text(
                        '騒がしい',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, -0.5),
                      child: IconButton(
                        iconSize: 50,
                        icon: const Icon(
                          Icons.piano_off,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional(0, 0.8),
                      child: Text(
                        '静か',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, -0.5),
                      child: IconButton(
                        iconSize: 50,
                        icon: const Icon(
                          Icons.local_restaurant,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional(0, 0.8),
                      child: Text(
                        'レストラン',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, -0.5),
                      child: IconButton(
                        iconSize: 50,
                        icon: const Icon(
                          Icons.record_voice_over,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional(0, 0.8),
                      child: Text(
                        '会話',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, -0.5),
                      child: IconButton(
                        iconSize: 50,
                        icon: const Icon(
                          Icons.phone_in_talk,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional(0, 0.8),
                      child: Text(
                        '電話',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
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
                        Page1(),
                        page2(),
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
