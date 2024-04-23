import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_management_presentation/app/widgets/title_widget.dart';

class AgendaSlide extends FlutterDeckSlideWidget {
  const AgendaSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/agenda-slide',
            footer: FlutterDeckFooterConfiguration(showFooter: false),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.template(
      headerBuilder: (_) => const TitleWidget('Agenda'),
      contentBuilder: (_) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 100),
        child: FlutterDeckBulletList(
          items: const [
            'Flutter State Management',
            'Bloc & Cubit',
            'Riverpod',
            'formigas_mvc',
          ],
        ),
      ),
    );
  }
}
