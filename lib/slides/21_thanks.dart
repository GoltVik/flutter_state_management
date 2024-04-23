import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ThankYouSlide extends FlutterDeckSlideWidget {
  const ThankYouSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
              route: '/thanks-slide', steps: 2),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.custom(
      builder: (context) {
        return FlutterDeckSlideStepsBuilder(
          builder: (context, step) {
            if (step == 1) {
              return FlutterDeckSlide.bigFact(
                title: 'QA',
                subtitle: 'let\'s talk!',
                theme: FlutterDeckTheme.of(context).copyWith(
                  bigFactSlideTheme: const FlutterDeckBigFactSlideThemeData(
                    titleTextStyle: TextStyle(color: Colors.amber),
                  ),
                ),
              );
            } else {
              return FlutterDeckSlide.template(
                headerBuilder: (_) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: Image.asset(
                      'assets/thanks.png',
                      color: Colors.amber,
                    ),
                  ),
                ),
                contentBuilder: (_) => Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Flutter State Management: https://docs.flutter.dev/data-and-backend/state-mgmt/intro',
                      'Bloc/Cubit: https://bloclibrary.dev/',
                      'Provider: https://riverpod.dev/',
                      'Formigas_mvc: https://pub.dev/packages/formigas_mvc',
                      'Flutter Deck: https://pub.dev/packages/flutter_deck',
                      'Flutter Deck Slides: https://github.com/GoltVik/flutter_state_management'
                    ]
                        .map((text) => Padding(
                              padding: const EdgeInsets.only(top: 24.0),
                              child: SelectableText(
                                text,
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                            ))
                        .toList(),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
