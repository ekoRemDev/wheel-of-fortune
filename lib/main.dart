import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fortune Wheel Example',
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  StreamController<int> selected = StreamController<int>();
  int selectedItem = 0;
  bool isResultVisible = false;

  @override
  void initState() {
    // selected.close();
    super.initState();
  }

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.07;

    final items = <String>[
      'Prize 1',
      'Prize 2',
      'Prize 3',
      'Prize 4',
      'Prize 5',
      'Prize 6',
      'Prize 7',
      'Prize 8',
    ];

    final prizeIcons = <Icon>[
      Icon(
        Icons.android,
        size: iconSize,
        color: Colors.white,
      ),
      Icon(
        Icons.backup,
        size: iconSize,
        color: Colors.white,
      ),
      Icon(
        Icons.camera,
        size: iconSize,
        color: Colors.white,
      ),
      Icon(
        Icons.cake,
        size: iconSize,
        color: Colors.white,
      ),
      Icon(
        Icons.bakery_dining,
        size: iconSize,
        color: Colors.white,
      ),
      Icon(
        Icons.eco_sharp,
        size: iconSize,
        color: Colors.white,
      ),
      Icon(
        Icons.cake,
        size: iconSize,
        color: Colors.white,
      ),
      Icon(
        Icons.android,
        size: iconSize,
        color: Colors.white,
      ),
    ];

    final prizeDescriptions = <String>[
      'Prize 1 Description',
      'Prize 2 Description',
      'Prize 3 Description',
      'Prize 4 Description',
      'Prize 5 Description',
      'Prize 6 Description',
      'Prize 7 Description',
      'Prize 8 Description',
    ];

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Flutter Fortune Wheel'),
      // ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/game_background.png"),
                fit: BoxFit.cover,
              ),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Center(
            child: Container(
              height: screenHeight * 0.8,
              width:screenWidth * 0.8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: FortuneWheel(
                        selected: selected.stream,
                        onAnimationStart: () {
                          setState(() {
                            isResultVisible = false;
                          });
                        },
                        onAnimationEnd: () {
                          setState(() {
                            isResultVisible = true;
                          });
                        },
                        items: [
                          for (var it in items)
                            FortuneItem(
                                child: Container(
                                    child: RotatedBox(
                              quarterTurns: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // SizedBox(
                                  //   height: screenHeight * 0.02,
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top : screenHeight * 0.01,
                                        bottom : screenHeight * 0.01,
                                        left : screenWidth * 0.04,
                                        right : screenWidth * 0.04,
                                    ),
                                    child: prizeIcons[items.indexOf(it)],
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.01,
                                  ),
                                  Text(it, style: TextStyle(color: Colors.white, fontSize: 12),),
                                  SizedBox(
                                    height: screenHeight * 0.02,
                                  ),
                                ],
                              ),
                            ))),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      height: 50,
                      width: 300,
                      child: Visibility(
                        visible: isResultVisible,
                        child: MaterialButton(
                          color: Colors.amber,
                          // shape: StadiumBorder(),
                          onPressed: () {
                            setState(() {
                              selectedItem = Random().nextInt(items.length);
                              selected.add(selectedItem);
                              isResultVisible = false;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Turn the Wheel",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 40,
                      child: Visibility(
                          visible: isResultVisible,
                          child: Text(items[selectedItem].toString())),
                    ),
                    Container(
                      height: 40,
                      child: Visibility(
                        visible: isResultVisible,
                        child: Text("${prizeDescriptions[selectedItem]}",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.green,
                                fontWeight: FontWeight.w600)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
