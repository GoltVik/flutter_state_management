import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_management_presentation/app/widgets/title_widget.dart';

class BlocStateManagementExampleSlide extends FlutterDeckSlideWidget {
  const BlocStateManagementExampleSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/bloc_management_example-slide',
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
            const TitleWidget('Bloc State Management Example'),
            Expanded(
              child: FlutterDeckSlideStepsBuilder(
                builder: (context, step) {
                  return FlutterDeckSlide.split(
                    splitRatio: const SplitSlideRatio(left: 2, right: 3),
                    leftBuilder: (_) => ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: step == 1
                          ? Image.asset('assets/bloc_schema_view.png')
                          : Image.asset('assets/bloc_schema_bloc.png'),
                    ),
                    rightBuilder: (_) => SingleChildScrollView(
                      child: step == 1 ? _mainView() : _mainBloc(),
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
      class BlocCounterView extends StatelessWidget {
      const BlocCounterView({super.key});
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: const Text('Bloc Counter')),
          body: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Center(
                child: Text('Counter: \${state.counter}'),
              );
            },
          ),
          floatingActionButton: FloatingActionCounterButton(
            onIncrement: () => context.read<CounterBloc>().add(const Increment()),
            onDecrement: () => context.read<CounterBloc>().add(const Decrement()),
            childOne: const Icon(Icons.add),
            childTwo: const Icon(Icons.remove),
          ),
        );
      }
    }
      ''',
    );
  }

  Widget _mainBloc() {
    return const FlutterDeckCodeHighlight(
      code: '''
      import 'package:flutter/foundation.dart';
      import 'package:flutter_bloc/flutter_bloc.dart';
      
      ///Events
      @immutable
      sealed class CounterEvent {
        const CounterEvent();
      }
      
      class Increment extends CounterEvent {
        const Increment();
      }
      
      class Decrement extends CounterEvent {
        const Decrement();
      }
      
      ///States
      @immutable
      class CounterState {
        final int counter;
      
        const CounterState(this.counter);
      }
      
      ///Bloc
      class CounterBloc extends Bloc<CounterEvent, CounterState> {
        int _counter = 0;
      
        CounterBloc() : super(const CounterState(0)) {
          on<Increment>((event, emit) => _increment(emit));
          on<Decrement>((event, emit) => _decrement(emit));
        }
      
        _increment(Emitter<CounterState> emit) => emit(CounterState(++_counter));
      
        _decrement(Emitter<CounterState> emit) => emit(CounterState(--_counter));
      }
      ''',
    );
  }
}
