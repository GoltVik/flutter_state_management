import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../app/widgets/title_widget.dart';

class MVCManagementExampleSlide extends FlutterDeckSlideWidget {
  const MVCManagementExampleSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/mvc_management_example-slide',
            footer: FlutterDeckFooterConfiguration(
              showSlideNumbers: true,
              widget: SelectableText('https://pub.dev/packages/formigas_mvc'),
            ),
            steps: 2,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.custom(
      builder: (context) {
        return Column(
          children: [
            const TitleWidget('FormigasMVC State Management'),
            Expanded(
              child: FlutterDeckSlide.split(
                leftBuilder: (_) => ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/mvc_schema.png',
                    fit: BoxFit.fill,
                  ),
                ),
                rightBuilder: (_) => FlutterDeckSlideStepsBuilder(
                  builder: (context, step) {
                    return step == 1
                        ? _mainMVCViewWidget()
                        : _mainMVCControllerWidget();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _mainMVCViewWidget() {
    return const FlutterDeckCodeHighlight(
      code: '''
       class MViewCExample extends MViewC<ExampleController, ExampleModel> {
 
        const MViewCExample({
          required super.controller,
          super.key,
        });
      
        @override
        Widget build(BuildContext context, ExampleModel model) => Scaffold(
              appBar: AppBar(
                title: const Text('MViewCExample'),
              ),
              body: Center(
                child: Text('Counter: \${model.value}'),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: controller.increaseAndShuffleColor,
                backgroundColor: model.color,
                child: const Icon(Icons.plus_one),
              ),
            );
       }
      ''',
    );
  }

  Widget _mainMVCControllerWidget() {
    return const FlutterDeckCodeHighlight(
      code: '''
      class MvcExampleController extends MVController<ExampleModel> {
        MvcExampleController() : super(ExampleModel(value: 0, color: Colors.blue));
      
        void increaseAndShuffleColor() {
          model = model.copyWith(
            value: ++model.value,
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          );
        }
      }
      ''',
    );
  }
}
