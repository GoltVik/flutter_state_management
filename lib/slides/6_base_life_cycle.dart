import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_management_presentation/app/widgets/title_widget.dart';

class StateLifecycleSlide extends FlutterDeckSlideWidget {
  const StateLifecycleSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/state_lifecycle-slide',
            title: 'State Lifecycle',
            steps: 6,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.custom(
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(62.0),
            child: TitleWidget('Base State Lifecycle'),
          ),
          Expanded(
            child: FlutterDeckSlideStepsBuilder(
              builder: (context, step) {
                return FlutterDeckSlide.split(
                  theme: FlutterDeckTheme.of(context).copyWith(
                    splitSlideTheme: const FlutterDeckSplitSlideThemeData(
                      rightBackgroundColor: Colors.black45,
                    ),
                  ),
                  leftBuilder: (context) => FlutterDeckBulletList(
                    useSteps: true,
                    items: [
                      'initState()\n',
                      'didChangeDependencies()\n',
                      if (step > 3) 'setState()\n',
                      'build(Context context)\n',
                      'deactivate()\n',
                      'dispose()',
                      ''
                    ],
                  ),
                  rightBuilder: (_) => FlutterDeckBulletList(
                    useSteps: true,
                    items: [
                      'called when the State object is inserted into the tree.\n',
                      'called when a dependency of this State object changes.\n',
                      if (step > 3)
                        'called when the State object is marked as dirty and needs to be rebuilt.\n',
                      'called to create the widgets that this State object represents.\n',
                      'called when a widget is removed from the widget tree.\n',
                      'called when a StatefulWidget is permanently removed.\n',
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
