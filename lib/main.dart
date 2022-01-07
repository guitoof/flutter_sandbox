import 'package:flutter/material.dart';
import 'package:flutter_sandbox/global_gestures_listener_plugin/global_gesture_listener_with_stack.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final String title = 'Flutter Sandbox App';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  void _doStuff() {
    print('🔵 Any child button DETECTED TAP');
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: GlobalGestureListenerWithStack(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Here is the result of the stuff you've done:"),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _doStuff,
            tooltip: 'Do stuff...',
            child: Icon(Icons.science),
          ),
        ),
      ),
    );
  }
}
