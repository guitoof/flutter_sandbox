import 'package:flutter/material.dart';

class MyHero extends StatefulWidget {
  final String tag;
  final Widget child;

  MyHero({this.tag, this.child});

  @override
  MyHeroState createState() => MyHeroState();
}

class MyHeroState extends State<MyHero> {
  bool isFlying = false;

  void startFlying() {
    setState(() {
      isFlying = true;
    });
  }

  void endFlying() {
    setState(() {
      isFlying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this.isFlying) {
      return Container();
    }
    return widget.child;
  }
}
