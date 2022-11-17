import 'package:flutter/material.dart';

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
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [1, 2]
                .map((item) => ElevatedButton(
                    style: TextButton.styleFrom(minimumSize: Size(150, 150)),
                    onPressed: () {
                      print('Click on: $item');
                    },
                    child: Text(
                      item.toString(),
                      style: TextStyle(fontSize: 32),
                    )))
                .toList(),
          ),
        ),
      ),
    );
  }
}
