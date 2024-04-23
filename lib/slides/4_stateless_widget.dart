import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_management_presentation/app/widgets/title_widget.dart';

class StatelessWidgetSlide extends FlutterDeckSlideWidget {
  const StatelessWidgetSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/stateless-slide',
            steps: 3,
            footer: FlutterDeckFooterConfiguration(showFooter: false),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.template(
        headerBuilder: (_) => const TitleWidget('StatelessWidget'),
        contentBuilder: (context) {
          return FlutterDeckSlide.split(
            leftBuilder: (_) => Container(
              margin: const EdgeInsets.all(100),
              child: FlutterDeckBulletList(
                useSteps: true,
                items: const [
                  'is used to create widgets that do not require mutable state',
                  'rebuild depends on the parent widget/data',
                  'is a subclass of the Widget class',
                ],
              ),
            ),
            rightBuilder: (_) => FlutterDeckSlideStepsBuilder(
              builder: (context, step) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _mainStatelessWidget(),
                    if (step > 2)
                      Container(
                        margin: const EdgeInsets.only(top: 24),
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Image.asset('assets/stateless_widget.png'),
                      ),
                  ],
                );
              },
            ),
          );
        });
  }

  Widget _mainStatelessWidget() {
    return const FlutterDeckCodeHighlight(
      code: '''
      class SomeStatelessWidget extends StatelessWidget {

        const SomeStatelessWidget({super.key});
      
        @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('StatelessWidget'),
            ),
            body: const Center(
              child: Text('Hello StatelessWidget!'),
            ),
          );
        }
      }
      ''',
    );
  }
}
