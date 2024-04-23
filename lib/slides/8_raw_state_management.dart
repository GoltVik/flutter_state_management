import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class RawStateManagementSlide extends FlutterDeckSlideWidget {
  const RawStateManagementSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/raw_management-slide',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: 'Raw Flutter State Management',
      subtitle: 'just setState(), easy, right? 😅',
      theme: FlutterDeckTheme.of(context).copyWith(
        bigFactSlideTheme: const FlutterDeckBigFactSlideThemeData(
          titleTextStyle: TextStyle(color: Colors.amber),
        ),
      ),
    );
  }
}
