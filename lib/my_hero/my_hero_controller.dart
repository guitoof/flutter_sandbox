import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/my_hero/my_hero.dart';

class FlyingHero extends StatefulWidget {
  final Rect fromRect;
  final Rect toRect;
  final Widget child;
  final Function onFlyingEnded;

  FlyingHero({this.fromRect, this.toRect, this.child, this.onFlyingEnded});

  @override
  FlyingHeroState createState() => FlyingHeroState();
}

class FlyingHeroState extends State<FlyingHero> {
  bool flying = false;

  @override
  void initState() {
    Timer(Duration(milliseconds: 0), () {
      setState(() {
        flying = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      child: widget.child,
      duration: Duration(milliseconds: 200),
      top: flying ? widget.toRect.top : widget.fromRect.top,
      left: flying ? widget.toRect.left : widget.fromRect.left,
      height: flying ? widget.toRect.height : widget.fromRect.height,
      width: flying ? widget.toRect.width : widget.fromRect.width,
      onEnd: this.widget.onFlyingEnded,
    );
  }
}

class MyHeroController extends NavigatorObserver {
  Map<String, MyHeroState> _inviteHeroes(BuildContext context) {
    Map<String, MyHeroState> heroes = {};
    void _visitHero(Element element) {
      if (element.widget is MyHero) {
        final StatefulElement hero = element as StatefulElement;
        final MyHero heroWidget = hero.widget;
        final dynamic tag = heroWidget.tag;
        final Widget child = heroWidget.child;
        print("Adding new Hero, tag = $tag, type = ${child.runtimeType}");
        heroes[tag] = hero.state;
      } else {
        element.visitChildren(_visitHero);
      }
    }

    context.visitChildElements(_visitHero);
    return heroes;
  }

  Rect getHeroRect(MyHeroState hero, PageRoute fromRoute) {
    final box = (hero.context.findRenderObject() as RenderBox);
    final RenderBox ancestor =
        fromRoute.subtreeContext?.findRenderObject() as RenderBox;
    assert(box != null && box.hasSize && box.size.isFinite);

    final Rect toto = MatrixUtils.transformRect(
      box.getTransformTo(ancestor),
      Offset.zero & box.size,
    );
    return toto;
  }

  void flyFromTo(Route<dynamic> fromRoute, Route<dynamic> toRoute) {
    /// TODO: understand this addPostFrameCallback method
    WidgetsBinding.instance.addPostFrameCallback((Duration value) {
      Map<String, MyHeroState> _fromHeroes =
          _inviteHeroes((fromRoute as PageRoute).subtreeContext);
      Map<String, MyHeroState> _toHeroes =
          _inviteHeroes((toRoute as PageRoute).subtreeContext);

      // print(fromRoute);
      // print(toRoute);

      for (MyHeroState hero in _fromHeroes.values) {
        OverlayEntry overlayEntry;

        final Rect fromHeroRect = getHeroRect(hero, fromRoute);
        final Rect toHeroRect =
            getHeroRect(_toHeroes[hero.widget.tag], toRoute);

        hero.startFlying();
        _toHeroes[hero.widget.tag].startFlying();

        overlayEntry = OverlayEntry(
          builder: (BuildContext context) => FlyingHero(
            fromRect: fromHeroRect,
            toRect: toHeroRect,
            child: hero.widget.child,
            onFlyingEnded: () {
              hero.endFlying();
              _toHeroes[hero.widget.tag].endFlying();
              overlayEntry.remove();
            },
          ),
        );
        Navigator.of(navigator.context).overlay.insert(overlayEntry);
      }
    });
  }

  @override
  void didPush(Route<dynamic> toRoute, Route<dynamic> fromRoute) {
    /// No Hero animation can occur on the initial route
    if (toRoute.isFirst) {
      return;
    }
    flyFromTo(fromRoute, toRoute);
    super.didPush(toRoute, fromRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    flyFromTo(route, previousRoute);
    super.didPop(route, previousRoute);
  }
}
