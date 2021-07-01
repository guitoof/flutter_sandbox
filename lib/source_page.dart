import 'package:flutter/material.dart';
import 'package:flutter_sandbox/hero_data.dart';

class HeroArguments {
  final HeroModel hero;

  HeroArguments({this.hero});
}

// class HeroTile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class SourcePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Source page"),
        backgroundColor: Colors.black,
      ),
      body: ListView(children: [
        ...heroesData.map(
          (hero) => InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'destination_page',
                  arguments: HeroArguments(hero: hero));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Hero(
                    tag: hero.id,
                    child: Image.network(
                      hero.avatar,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ListTile(
                    title: Text(
                      hero.name,
                    ),
                    subtitle: Text(hero.description),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
