import 'package:flutter/material.dart';
import 'package:flutter_sandbox/destination_page.dart';
import 'package:flutter_sandbox/my_hero/my_hero_controller.dart';
import 'package:flutter_sandbox/source_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [MyHeroController()],
      initialRoute: 'source_page',
      routes: {
        'source_page': (context) => SourcePage(),
        'destination_page': (context) => DestinationPage(),
      },
    );
  }
}
