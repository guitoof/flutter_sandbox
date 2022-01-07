import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

// Custom Gesture Recognizer.
// rejectGesture() is overridden. When a gesture is rejected, this is the function that is called. By default, it disposes of the
// Recognizer and runs clean up. However we modified it so that instead the Recognizer is disposed of, it is actually manually added.
// The result is instead you have one Recognizer winning the Arena, you have two. It is a win-win.
class AllowMultipleTapGesturesRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

class GlobalGesturesListener extends StatelessWidget {
  final Widget child;

  GlobalGesturesListener({required this.child});

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: {
        AllowMultipleTapGesturesRecognizer:
            GestureRecognizerFactoryWithHandlers<
                AllowMultipleTapGesturesRecognizer>(
          () => AllowMultipleTapGesturesRecognizer(),
          (AllowMultipleTapGesturesRecognizer instance) {
            instance.onTap =
                () => print('🔴 Global Gesture Listener Plugin DETECTED TAP');
          },
        ),
      },
      child: child,
    );
  }
}
