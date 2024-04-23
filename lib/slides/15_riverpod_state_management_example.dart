import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_management_presentation/app/widgets/title_widget.dart';

class RiverpodStateManagementExampleSlide extends FlutterDeckSlideWidget {
  const RiverpodStateManagementExampleSlide()
      : super(
            configuration: const FlutterDeckSlideConfiguration(
          route: '/riverpod_management_example-slide',
          steps: 2,
          footer: FlutterDeckFooterConfiguration(
            showSlideNumbers: true,
            widget: SelectableText('https://riverpod.dev/'),
          ),
        ));

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.custom(
      builder: (context) {
        return Column(
          children: [
            const TitleWidget('Riverpod State Management'),
            Expanded(
              child: FlutterDeckSlide.split(
                leftBuilder: (_) => ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/riverpod_schema.png',
                    fit: BoxFit.fill,
                  ),
                ),
                rightBuilder: (_) => FlutterDeckSlideStepsBuilder(
                  builder: (context, step) {
                    return step == 1
                        ? _mainRiverpodViewWidget()
                        : _mainRiverpodWidget();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _mainRiverpodViewWidget() {
    return const FlutterDeckCodeHighlight(
      code: '''
       class RiverpodCounterView extends ConsumerWidget {
        const RiverpodCounterView({super.key});
      
        @override
        Widget build(BuildContext context, WidgetRef ref) {
          final int counterValue = ref.watch(counterRiverpodProvider);
      
          return Scaffold(
            appBar: AppBar(title: const Text('Riverpod Counter')),
            body: Center(child: 
                Text('Counter: \$counterValue'),
              ),
            floatingActionButton: FloatingActionCounterButton(
              onIncrement: () => ref.read(counterRiverpodProvider.notifier).increment(),
              onDecrement: () => ref.read(counterRiverpodProvider.notifier).decrement(),
              childOne: const Icon(Icons.add),
              childTwo: const Icon(Icons.remove),
            ),
          );
        }
      }
      ''',
    );
  }

  Widget _mainRiverpodWidget() {
    return const FlutterDeckCodeHighlight(
      code: '''
      import 'package:riverpod_annotation/riverpod_annotation.dart';
    
      part 'counter_riverpod.g.dart';
      
      @riverpod
      class CounterRiverpod extends _\$CounterRiverpod {
        @override
        int build() => 0;
      
        void increment() => state++;
      
        void decrement() => state--;
      }
      ''',
    );
  }
}
