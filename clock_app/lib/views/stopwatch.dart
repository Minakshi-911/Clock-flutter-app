import 'dart:async';
import 'package:clock_app/constants/theme_data.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class FlutterStopWatch extends StatefulWidget {
  @override
  _FlutterStopWatchState createState() => _FlutterStopWatchState();
}

class _FlutterStopWatchState extends State<FlutterStopWatch> {
 late Stopwatch stopwatch;
  late Timer t;

  void handleStartStop() {
    if(stopwatch.isRunning) {
      stopwatch.stop();
    }
    else {
      stopwatch.start();
    }
  }

  String returnFormattedText() {
    var milli = stopwatch.elapsed.inMilliseconds;

    String milliseconds = (milli % 1000).toString().padLeft(3, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");

    return "$minutes:$seconds:$milliseconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();

    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.pageBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Text(
                  'Stopwatch',
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w700,
                      color: CustomColors.primaryTextColor,
                      fontSize: 24),
                ),
            ),
            SafeArea(
              child: Flexible(
                flex: 2,
                child: Center(
                  child: Column(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              
                      CupertinoButton(
                        onPressed: () {
                          handleStartStop();
                        },
                        padding: EdgeInsets.all(0),
                        child: Container(
                          height: 300,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xff0395eb),
                              width: 4,
                            ),
                          ),
                          child: Text(returnFormattedText(), style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ),
              
                      SizedBox(height: 15,),
              
                      CupertinoButton(
                        onPressed: () {
                          stopwatch.reset();
                        },
                        padding: EdgeInsets.all(0),
                        child: Text(
                          "Reset", 
                          style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontFamily: 'avenir',
                        ),),
                      ),
              
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}