import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

void main() {
  runApp(
      ExampleApp(),
  );
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fortune Wheel Demo',
      debugShowCheckedModeBanner: false,
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
      '1GB',
      '2GB',
      '4GB',
      '8GB',
      '120 min',
      '180 min',
      '240 min',
      '25GB\n600 min',
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
          // Container(
          //     height: MediaQuery.of(context).size.height,
          //     width: MediaQuery.of(context).size.width,
          //   color: Colors.blue[100],
          // ),
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
                        physics: CircularPanPhysics(
                          duration: Duration(seconds: 1),
                          curve: Curves.decelerate,
                        ),
                        onFling: () {
                          //
                        },
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
                        indicators: [
                          FortuneIndicator(
                            alignment: Alignment.topCenter,
                            child: TriangleIndicator(color: Colors.blueGrey,),
                          ),
                        ],
                        items: [
                          FortuneItem(
                            child: RotatedBox(
                              quarterTurns: 1,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top : screenHeight * 0.05,
                                        bottom : screenHeight * 0.01,
                                        left : screenWidth * 0.04,
                                        right : screenWidth * 0.04,
                                      ),
                                      child: prizeIcons[0],
                                    ),
                                    Text(items[0]),
                                  ],
                                ),
                            ),
                            style: FortuneItemStyle(
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(color: Colors.white, fontSize: 12),
                              color: Colors.cyan[300], // <-- custom circle slice fill color
                              borderColor: Colors.blue[900], // <-- custom circle slice stroke color
                              borderWidth: 1, // <-- custom circle slice stroke width
                            ),
                          ),
                          FortuneItem(
                            child: RotatedBox(
                                quarterTurns: 1,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top : screenHeight * 0.05,
                                      bottom : screenHeight * 0.01,
                                      left : screenWidth * 0.04,
                                      right : screenWidth * 0.04,
                                    ),
                                    child: prizeIcons[1],
                                  ),
                                  Text(items[1]),
                                ],
                              ),
                            ),
                            style: FortuneItemStyle(
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(color: Colors.white, fontSize: 12),
                              color: Colors.red[200], // <-- custom circle slice fill color
                              borderColor: Colors.blue[900], // <-- custom circle slice stroke color
                              borderWidth: 1, // <-- custom circle slice stroke width
                            ),
                          ),
                          FortuneItem(
                            child: RotatedBox(
                                quarterTurns: 1,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top : screenHeight * 0.05,
                                      bottom : screenHeight * 0.01,
                                      left : screenWidth * 0.04,
                                      right : screenWidth * 0.04,
                                    ),
                                    child: prizeIcons[2],
                                  ),
                                  Text(items[2]),
                                ],
                              ),
                            ),
                            style: FortuneItemStyle(
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(color: Colors.white, fontSize: 12),
                              color: Colors.amber[300], // <-- custom circle slice fill color
                              borderColor: Colors.blue[900], // <-- custom circle slice stroke color
                              borderWidth: 1, // <-- custom circle slice stroke width
                            ),
                          ),
                          FortuneItem(
                            child: RotatedBox(
                                quarterTurns: 1,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top : screenHeight * 0.05,
                                      bottom : screenHeight * 0.01,
                                      left : screenWidth * 0.04,
                                      right : screenWidth * 0.04,
                                    ),
                                    child: prizeIcons[3],
                                  ),
                                  Text(items[3]),
                                ],
                              ),
                            ),
                            style: FortuneItemStyle(
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(color: Colors.white, fontSize: 12),
                              color: Colors.blue[200], // <-- custom circle slice fill color
                              borderColor: Colors.blue[900], // <-- custom circle slice stroke color
                              borderWidth: 1, // <-- custom circle slice stroke width
                            ),
                          ),
                          FortuneItem(
                            child: RotatedBox(
                                quarterTurns: 1,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top : screenHeight * 0.05,
                                      bottom : screenHeight * 0.01,
                                      left : screenWidth * 0.04,
                                      right : screenWidth * 0.04,
                                    ),
                                    child: prizeIcons[4],
                                  ),
                                  Text(items[4]),
                                ],
                              ),
                            ),
                            style: FortuneItemStyle(
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(color: Colors.white, fontSize: 12),
                              color: Colors.red[500], // <-- custom circle slice fill color
                              borderColor: Colors.blue[900], // <-- custom circle slice stroke color
                              borderWidth: 1, // <-- custom circle slice stroke width
                            ),
                          ),
                          FortuneItem(
                            child: RotatedBox(
                                quarterTurns: 1,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top : screenHeight * 0.05,
                                      bottom : screenHeight * 0.01,
                                      left : screenWidth * 0.04,
                                      right : screenWidth * 0.04,
                                    ),
                                    child: prizeIcons[5],
                                  ),
                                  Text(items[5]),
                                ],
                              ),
                            ),
                            style: FortuneItemStyle(
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(color: Colors.white, fontSize: 12),
                              color: Colors.yellow[600], // <-- custom circle slice fill color
                              borderColor: Colors.blue[900], // <-- custom circle slice stroke color
                              borderWidth: 1, // <-- custom circle slice stroke width
                            ),
                          ),
                          FortuneItem(
                            child: RotatedBox(
                                quarterTurns: 1,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top : screenHeight * 0.05,
                                      bottom : screenHeight * 0.01,
                                      left : screenWidth * 0.04,
                                      right : screenWidth * 0.04,
                                    ),
                                    child: prizeIcons[6],
                                  ),
                                  Text(items[6]),
                                ],
                              ),
                            ),
                            style: FortuneItemStyle(
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(color: Colors.white, fontSize: 12),
                              color: Colors.green[700], // <-- custom circle slice fill color
                              borderColor: Colors.blue[900], // <-- custom circle slice stroke color
                              borderWidth: 1, // <-- custom circle slice stroke width
                            ),
                          ),
                          FortuneItem(
                            child: RotatedBox(
                                quarterTurns: 1,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top : screenHeight * 0.05,
                                      bottom : screenHeight * 0.01,
                                      left : screenWidth * 0.04,
                                      right : screenWidth * 0.04,
                                    ),
                                    child: prizeIcons[7],
                                  ),
                                  Text(items[7],),
                                ],
                              ),
                            ),
                            style: FortuneItemStyle(
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(color: Colors.white, fontSize: 12),
                              color: Colors.purple[800], // <-- custom circle slice fill color
                              borderColor: Colors.blue[900], // <-- custom circle slice stroke color
                              borderWidth: 1, // <-- custom circle slice stroke width
                            ),
                          ),
                          // for (var it in items)
                          //   FortuneItem(
                          //       child: Container(
                          //           child: RotatedBox(
                          //     quarterTurns: 1,
                          //     child: Column(
                          //       mainAxisAlignment: MainAxisAlignment.start,
                          //       children: [
                          //         // SizedBox(
                          //         //   height: screenHeight * 0.02,
                          //         // ),
                          //         Padding(
                          //           padding: EdgeInsets.only(
                          //               top : screenHeight * 0.01,
                          //               bottom : screenHeight * 0.01,
                          //               left : screenWidth * 0.04,
                          //               right : screenWidth * 0.04,
                          //           ),
                          //           child: prizeIcons[items.indexOf(it)],
                          //         ),
                          //         SizedBox(
                          //           height: screenHeight * 0.01,
                          //         ),
                          //         Text(it, style: TextStyle(color: Colors.white, fontSize: 12),),
                          //         SizedBox(
                          //           height: screenHeight * 0.02,
                          //         ),
                          //       ],
                          //     ),
                          //   ))),
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
                              // selectedItem = Random().nextInt(items.length);
                              selectedItem = 4;
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
                          child: Text(items[selectedItem].toString(), style: TextStyle(color: Colors.white, fontSize: 16),),),
                    ),
                    Container(
                      height: 40,
                      child: Visibility(
                        visible: isResultVisible,
                        child: Text("${prizeDescriptions[selectedItem]}",
                            style: TextStyle(color: Colors.white, fontSize: 24),),
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
