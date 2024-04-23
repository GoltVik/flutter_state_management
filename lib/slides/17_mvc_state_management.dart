import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class MVCManagementSlide extends FlutterDeckSlideWidget {
  const MVCManagementSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/mvc_management-slide',
            footer: FlutterDeckFooterConfiguration(
              showSlideNumbers: true,
              widget: SelectableText('https://pub.dev/packages/formigas_mvc'),
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: 'Last but not least!',
      subtitle: 'What we\'ve done with MVC',
      theme: FlutterDeckTheme.of(context).copyWith(
        bigFactSlideTheme: const FlutterDeckBigFactSlideThemeData(
          titleTextStyle: TextStyle(color: Colors.amber),
        ),
      ),
    );
  }
}
