import 'package:flutter/material.dart';
import 'package:flutter_sandbox/body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final String title = 'Flutter Sandbox App';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sandbox',
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: AppBody(),
      ),
    );
  }
}
