import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GlobalGestureListenerWithOverlay extends StatefulWidget {
  final Widget child;

  const GlobalGestureListenerWithOverlay({Key? key, required this.child})
      : super(key: key);

  @override
  _GlobalGestureListenerWithOverlayState createState() =>
      _GlobalGestureListenerWithOverlayState();
}

class _GlobalGestureListenerWithOverlayState
    extends State<GlobalGestureListenerWithOverlay> {
  // late OverlayState? _overlay;
  late OverlayEntry _overlayEntry;

  @override
  void didChangeDependencies() {
    final overlay = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
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
        child: Opacity(
          opacity: 0.5,
          child: ColoredBox(
            color: Colors.yellow,
            child: SizedBox(
              width: 100,
              height: 100,
            ),
          ),
        ),
      );
    });
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      overlay?.insert(overlayEntry);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    _overlayEntry.remove();
    super.dispose();
  }
}

class AllowMultipleTapGesturesRecognizer extends TapGestureRecognizer {
  // @override
  // void acceptGesture(int pointer) {
  //   // rejectGesture(pointer);
  //   super.acceptGesture(pointer);
  // }
}
