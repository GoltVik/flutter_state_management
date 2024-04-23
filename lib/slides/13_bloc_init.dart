import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../app/widgets/title_widget.dart';

class BlocInitSlide extends FlutterDeckSlideWidget {
  const BlocInitSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/bloc_init-slide',
            footer: FlutterDeckFooterConfiguration(
              showSlideNumbers: true,
              widget: SelectableText('https://bloclibrary.dev/'),
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
            TitleWidget('Provider initialization'),
            Expanded(
              child: Center(
                child: FlutterDeckCodeHighlight(
                  code: '''
                  GoRoute(
                      path: '/bloc',
                      builder: (BuildContext context, GoRouterState state) {
                        return BlocProvider<CounterBloc>(
                          create: (context) => CounterBloc(),
                          child: const BlocCounterView(),
                        );
                      }
                   ),
                  ''',
                ),
              ),
            ),
            TitleWidget('Local initialization'),
            Expanded(
              child: Center(
                child: FlutterDeckCodeHighlight(
                  code: '''
                   return Scaffold(
                      appBar: AppBar(title: const Text('Bloc Counter')),
                      body: BlocBuilder<CounterBloc, CounterState>(
                        bloc: CounterBloc(),
                        builder: (context, state) {
                          return Center(
                            child: Text('Counter: \${state.counter}'),
                          );
                        },
                      ),
                   );
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
