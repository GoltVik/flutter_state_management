import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_management_presentation/app/widgets/title_widget.dart';

class CubitStateManagementExampleSlide extends FlutterDeckSlideWidget {
  const CubitStateManagementExampleSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/cubit_management_example-slide',
            steps: 2,
            footer: FlutterDeckFooterConfiguration(
              showSlideNumbers: true,
              widget: SelectableText('https://bloclibrary.dev/'),
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.custom(
      builder: (context) {
        return Column(
          children: [
            const TitleWidget('Cubit State Management Example'),
            Expanded(
              child: FlutterDeckSlideStepsBuilder(
                builder: (context, step) {
                  return FlutterDeckSlide.split(
                    splitRatio: const SplitSlideRatio(left: 2, right: 3),
                    leftBuilder: (_) => ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: step == 1
                          ? Image.asset('assets/cubit_schema_view.png')
                          : Image.asset('assets/cubit_schema_cubit.png'),
                    ),
                    rightBuilder: (_) => SingleChildScrollView(
                      child: step == 1 ? _mainView() : _mainCubit(),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _mainView() {
    return const FlutterDeckCodeHighlight(
      code: '''
      class CubitCounterView extends StatelessWidget {
      const CubitCounterView({super.key});
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: const Text('Cubit Counter')),
          body: BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Center(
                child: Text('Counter: \${state.counter}'),
              );
            },
          ),
          floatingActionButton: FloatingActionCounterButton(
            onIncrement: () => context.read<CounterCubit>().increment(),
            onDecrement: () => context.read<CounterCubit>().decrement(),
            childOne: const Icon(Icons.add),
            childTwo: const Icon(Icons.remove),
          ),
        );
      }
    }
      ''',
    );
  }

  Widget _mainCubit() {
    return const FlutterDeckCodeHighlight(
      code: '''
      import 'package:flutter/foundation.dart';
      import 'package:flutter_bloc/flutter_bloc.dart';
      
      ///States
      @immutable
      class CounterState {
        final int counter;
      
        const CounterState(this.counter);
      }
      
      ///Cubit
      class CounterCubit extends Cubit<CounterState> {
        int _counter = 0;
      
        CounterCubit() : super(const CounterState(0));
      
        increment() => emit(CounterState(++_counter));
      
        decrement() => emit(CounterState(--_counter));
      }
      ''',
    );
  }
}
