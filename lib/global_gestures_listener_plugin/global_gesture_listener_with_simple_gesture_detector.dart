import 'package:flutter/material.dart';

class GlobalGestureListnerWithSimpleGestureDetector extends StatelessWidget {
  final Widget child;

  const GlobalGestureListnerWithSimpleGestureDetector(
      {Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(
            '🔴 Global Gesture Listener Plugin DETECTED TAP ############################');
      },
      behavior: HitTestBehavior.translucent,
      child: child,
    );
  }
}
