import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class RiverpodManagementSlide extends FlutterDeckSlideWidget {
  const RiverpodManagementSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/riverpod_management-slide',
            footer: FlutterDeckFooterConfiguration(
              showSlideNumbers: true,
              widget: SelectableText('https://riverpod.dev/'),
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: 'What about other options ?',
      subtitle: 'let\'s see how Riverpod works!',
      theme: FlutterDeckTheme.of(context).copyWith(
        bigFactSlideTheme: const FlutterDeckBigFactSlideThemeData(
          titleTextStyle: TextStyle(color: Colors.amber),
        ),
      ),
    );
  }
}
