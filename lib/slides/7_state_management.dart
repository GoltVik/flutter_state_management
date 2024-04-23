import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class StateManagementSlide extends FlutterDeckSlideWidget {
  const StateManagementSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/state_management-slide',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: 'State Management',
      subtitle:
          'refers to the management of the state of one or more user interface controls such as text fields, submit buttons, radio buttons, etc. in a graphical user interface',
      theme: FlutterDeckTheme.of(context).copyWith(
        bigFactSlideTheme: const FlutterDeckBigFactSlideThemeData(
          titleTextStyle: TextStyle(color: Colors.amber),
        ),
      ),
    );
  }
}
