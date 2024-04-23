import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../app/widgets/title_widget.dart';

class RiverpodInitSlide extends FlutterDeckSlideWidget {
  const RiverpodInitSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/riverpod_init-slide',
            footer: FlutterDeckFooterConfiguration(
              showSlideNumbers: true,
              widget: SelectableText('https://riverpod.dev/'),
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
            TitleWidget('Global Scope initialization'),
            Expanded(
              child: Center(
                child: FlutterDeckCodeHighlight(
                  code: '''
    void main() {
         runApp(
               ProviderScope(
                  child: const MyApp(),
                ),
          );
      }
                  ''',
                ),
              ),
            ),
            TitleWidget('Local scope initialization (not recommended)'),
            Expanded(
              child: Center(
                child: FlutterDeckCodeHighlight(
                  code: '''
                   GoRoute(
                      path: '/riverpod',
                      builder: (BuildContext context, GoRouterState state) {
                        return const ProviderScope(
                          child: RiverpodCounterView(),
                        );
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
