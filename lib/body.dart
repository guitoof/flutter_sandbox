import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [1, 2]
            .map((item) => ElevatedButton(
                style: TextButton.styleFrom(minimumSize: Size(150, 150)),
                onPressed: () {
                  print('Click on: $item');
                  showFlexibleBottomSheet(
                    minHeight: 0,
                    initHeight: 0.5,
                    maxHeight: 1,
                    context: context,
                    builder: (
                      _,
                      scrollController,
                      __,
                    ) =>
                        _buildBottomSheet(
                            scrollController,
                            Text(
                              item.toString(),
                              style: TextStyle(fontSize: 32),
                            )),
                    anchors: [0, 0.5, 1],
                    isSafeArea: true,
                  );
                },
                child: Text(
                  item.toString(),
                  style: TextStyle(fontSize: 32),
                )))
            .toList(),
      ),
    );
  }

  Widget _buildBottomSheet(ScrollController scrollController, Widget child) {
    return Material(
      child: Container(
        child: ListView(
          controller: scrollController,
          children: [Center(child: child)],
        ),
      ),
    );
  }
}
