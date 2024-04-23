import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_management_presentation/app/widgets/title_widget.dart';

class SummarySlide extends FlutterDeckSlideWidget {
  const SummarySlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/summary-slide',
            steps: 7,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const TitleWidget('To summarize...'),
          Expanded(
            child: FlutterDeckBulletList(
              useSteps: true,
              items: const [
                'There no better or worse, everything has pros and cons',
                'Use what you are comfortable with',
                'Think about the future scalability',
                'Use local encapsulation/modularization',
                'Think about the learning curve',
                'But don\'t forget about StatefulWidgets!',
                'Keep building awesome things!',
              ],
            ),
          )
        ]);
      },
    );
  }
}
