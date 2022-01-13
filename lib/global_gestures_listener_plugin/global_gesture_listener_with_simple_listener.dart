import 'package:flutter/gestures.dart';
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
      onPointerDown: (PointerDownEvent event) {
        print(
            '🔴 Global Gesture Listener Plugin DETECTED POINTER DOWN ############################');
      },
      onPointerMove: (PointerMoveEvent event) {
        print(
            '🔴 Global Gesture Listener Plugin DETECTED POINTER MOVE ############################');
      },
      onPointerHover: (PointerHoverEvent event) {
        print(
            '🔴 Global Gesture Listener Plugin DETECTED POINTER HOVER ############################');
      },
      onPointerSignal: (PointerSignalEvent event) {
        print(
            '🔴 Global Gesture Listener Plugin DETECTED POINTER SIGNAL ############################');
      },
      onPointerCancel: (PointerCancelEvent event) {
        print(
            '🔴 Global Gesture Listener Plugin DETECTED POINTER CANCEL ############################');
      },
      // behavior: HitTestBehavior.translucent,
      child: child,
    );
  }
}
