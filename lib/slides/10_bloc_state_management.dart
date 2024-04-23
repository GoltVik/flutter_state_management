import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class BlocStateManagementSlide extends FlutterDeckSlideWidget {
  const BlocStateManagementSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/bloc_management-slide',
            footer: FlutterDeckFooterConfiguration(
              showSlideNumbers: true,
              widget: SelectableText('https://bloclibrary.dev/'),
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: 'Some logic separation',
      subtitle: 'what is a Bloc or Cubit? 🤔',
      theme: FlutterDeckTheme.of(context).copyWith(
        bigFactSlideTheme: const FlutterDeckBigFactSlideThemeData(
          titleTextStyle: TextStyle(color: Colors.amber),
        ),
      ),
    );
  }
}
