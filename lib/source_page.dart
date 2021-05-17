import 'package:flutter/material.dart';

class SourcePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Source page"),
      ),
      body: Container(
        alignment: Alignment.bottomLeft,
        child: Hero(
          tag: "dash",
          child: Image.network(
            "https://moventes.com/assets/img/techno/flutter_logo.png",
            height: 200,
            width: 200,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'destination_page');
        },
        child: Icon(Icons.flight_takeoff),
      ),
    );
  }
}
