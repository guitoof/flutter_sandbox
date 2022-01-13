import 'package:flutter/material.dart';

class GlobalGestureListnerWithSimpleListener extends StatelessWidget {
  final Widget child;

  const GlobalGestureListnerWithSimpleListener({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (PointerUpEvent event) {
        print(
            '🔴 Global Gesture Listener Plugin DETECTED POINTER UP ############################');
      },
      // behavior: HitTestBehavior.translucent,
      child: child,
    );
  }
}
