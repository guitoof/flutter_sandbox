import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final void Function(DragEndDetails)? onGestureDetected;

  @override
  _MyAppState createState() => _MyAppState();

  MyApp({this.onGestureDetected});
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: GestureDetector(
          onPanEnd: (DragEndDetails details) {
            widget.onGestureDetected?.call(details);
          },
          child: Container(
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
