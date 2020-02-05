import 'dart:async';
// import 'package:division/division.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'my first app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  static const int duration = 10;
  var _timer;
  var _start = 20;

  int player_1_tap = 0, player_2_tap = 0;

  bool isTimerRunning = false;
  var max = "";

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              RaisedButton(
                onPressed: () {
                  startTimer();
                },
                child: Text("start"),
              ),
              Text("$_start"),
              Row(
                children: <Widget>[
                  Text('player 1 $player_1_tap'),
                  Text('player 2 $player_2_tap')
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text("press 1"),
                    onPressed: () {
                      setState(() {
                        if(isTimerRunning==true)
                        {
                          player_1_tap++;
                        }
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text("press 1"),
                    onPressed: () {
                      setState(() {
                        if(isTimerRunning==true)
                        {
                          player_2_tap++;
                        }
                      });
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              Text(max),
            ]))
        );
  }

  void startTimer() {
    isTimerRunning = true;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            isTimerRunning = false;

            if (player_1_tap>player_2_tap) {
              setState(() {
                max = "Player 1 high score $player_1_tap";
              });
            } else {
               setState(() {
                max = "Player 2 high score $player_2_tap";
              });
            }
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }
}
