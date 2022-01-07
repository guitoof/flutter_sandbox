import 'package:flutter/material.dart';

class GlobalGestureListenerWithStack extends StatefulWidget {
  final Widget child;

  const GlobalGestureListenerWithStack({Key? key, required this.child})
      : super(key: key);

  @override
  _GlobalGestureListenerWithStackState createState() =>
      _GlobalGestureListenerWithStackState();
}

class _GlobalGestureListenerWithStackState
    extends State<GlobalGestureListenerWithStack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        GestureDetector(
          onTap: () {
            print('🔴 Global Gesture Listener Plugin DETECTED TAP');
          },
          behavior: HitTestBehavior.translucent,
          child: Opacity(
            opacity: 0.45,
            child: ColoredBox(
              color: Colors.yellow,
              child: SizedBox(
                width: 390,
                height: 844,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
