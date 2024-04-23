import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../app/widgets/title_widget.dart';

class StatefulWidgetSlide extends FlutterDeckSlideWidget {
  const StatefulWidgetSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/stateful-slide',
            steps: 3,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.template(
        headerBuilder: (_) => const TitleWidget('StatefulWidget'),
        contentBuilder: (context) {
          return FlutterDeckSlide.split(
            leftBuilder: (_) => Container(
              margin: const EdgeInsets.all(100),
              child: FlutterDeckBulletList(
                useSteps: true,
                items: const [
                  'is used state that can change during the lifetime of the widget',
                  'can manage its own state',
                  'still is a subclass of the Widget class',
                ],
              ),
            ),
            rightBuilder: (_) => FlutterDeckSlideStepsBuilder(
              builder: (context, step) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _mainStatefulWidget(),
                    if (step == 2)
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: _mainStateWidget(),
                      ),
                    if (step > 2)
                      Container(
                        margin: const EdgeInsets.only(top: 24),
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Image.asset('assets/stateful_widget.png'),
                      ),
                  ],
                );
              },
            ),
          );
        });
  }

  Widget _mainStatefulWidget() {
    return const FlutterDeckCodeHighlight(
      code: '''
      class SomeStatefulWidget extends StatefulWidget {
        const SomeStatefulWidget({super.key});
      
        @override
        State<SomeStatefulWidget> createState() => _SomeStatefulWidgetState();
      }
      ''',
    );
  }

  Widget _mainStateWidget() {
    return const FlutterDeckCodeHighlight(
      code: '''
      class _SomeStatefulWidgetState extends State<SomeStatefulWidget> {
        int _clickCounter = 0;
      
        @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('StatefulWidget'),
            ),
            body: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('You clicked \$_clickCounter times'),
                ElevatedButton(
                  onPressed: () => setState(() => _clickCounter++),
                  child: const Text('Click me!'),
                ),
              ],
            ),
          );
        }
      } 
      ''',
    );
  }
}
