import 'package:flutter/material.dart';
import 'package:flutter_sandbox/source_page.dart';

class DestinationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HeroModel hero =
        (ModalRoute.of(context).settings.arguments as HeroArguments).hero;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Destination Page"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: hero.id,
          child: Image.network(
            hero.avatar,
          ),
        ),
      ),
    );
  }
}
