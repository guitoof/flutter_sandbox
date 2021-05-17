import 'package:flutter/material.dart';
import 'package:flutter_sandbox/source_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SourcePage(),
      routes: {
        'source_page': (context) => SourcePage(),
        'destination_page': (context) => DestinationPage(),
      },
    );
  }
}
