import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class StateIntroSlide extends FlutterDeckSlideWidget {
  const StateIntroSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/state-slide',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: 'State',
      subtitle: 'Stateful or Stateless, what is going on there? ',
      theme: FlutterDeckTheme.of(context).copyWith(
        bigFactSlideTheme: const FlutterDeckBigFactSlideThemeData(
          titleTextStyle: TextStyle(color: Colors.amber),
        ),
      ),
    );
  }
}
