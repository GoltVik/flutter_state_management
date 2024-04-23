import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_management_presentation/app/widgets/title_widget.dart';

class RawStateManagementExampleSlide extends FlutterDeckSlideWidget {
  const RawStateManagementExampleSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/raw_management_example-slide',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.custom(
      builder: (context) {
        return Column(
          children: [
            const TitleWidget('Flutter State Management Example'),
            Expanded(
              child: FlutterDeckSlide.split(
                leftBuilder: (_) => ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset('assets/set_state_schema.png'),
                ),
                rightBuilder: (_) => _mainStateFulWidget(),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _mainStateFulWidget() {
    return const FlutterDeckCodeHighlight(
      code: '''
       class SomeStatefulWidget extends StatefulWidget {
        const SomeStatefulWidget({super.key});
      
        @override
        State<SomeStatefulWidget> createState() => _SomeStatefulWidgetState();
      }
      
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
