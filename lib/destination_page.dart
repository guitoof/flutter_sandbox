import 'package:flutter/material.dart';

class DestinationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Destination Page"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: "dash",
          child: Image.network(
            "https://moventes.com/assets/img/techno/flutter_logo.png",
          ),
        ),
      ),
    );
  }
}
