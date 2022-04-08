import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_sandbox/main.dart';

void main() {
  testWidgets(
      'should detect a gesture with Infinite velocity when fling gesture is performed with an infinite speed',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(onGestureDetected: (DragEndDetails details) {
      expect(
        details.velocity.pixelsPerSecond.dy,
        equals(double.infinity), // <------- We expect an infinite speed
      );
    }));
    await tester.flingFrom(
      const Offset(200, 200), // startLocation
      const Offset(0, 100), // offset
      double.infinity, // speed <------- We pass an infinite speed
    );
  });
}
