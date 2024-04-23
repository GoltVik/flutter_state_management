import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../app/widgets/title_widget.dart';

class MVCInitSlide extends FlutterDeckSlideWidget {
  const MVCInitSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/mvc_init-slide',
            footer: FlutterDeckFooterConfiguration(
              showSlideNumbers: true,
              widget: SelectableText('https://pub.dev/packages/formigas_mvc'),
            ),
          ),
        );

  @override
  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return const Column(
          children: [
            TitleWidget('Local scope initialization'),
            Expanded(
              child: Center(
                child: FlutterDeckCodeHighlight(
                  code: '''
                   GoRoute(
                      path: '/formigas_mvc',
                      builder: (BuildContext context, GoRouterState state) {
                        final controller = MvcExampleController();
                        return MViewCExample(controller: controller),
                      },
                    ),
                  ''',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
