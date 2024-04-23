import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_management_presentation/app/widgets/title_widget.dart';

class AboutMeSlide extends FlutterDeckSlideWidget {
  const AboutMeSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/about_me-slide',
            title: 'About',
            footer: FlutterDeckFooterConfiguration(showFooter: false),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.template(
      headerBuilder: (_) => const TitleWidget('About me'),
      contentBuilder: (_) => FlutterDeckSlide.split(
        splitRatio: const SplitSlideRatio(left: 3, right: 2),
        leftBuilder: (context) => FlutterDeckBulletList(
          items: const [
            'Software Engineer from Poland 🇵🇱',
            'Software Architect @ formigas 🚀',
            'Flutter & Dart Enthusiast 💙',
            'Organiser @ Flutter Stuttgart 🎉',
            'Motorcycle & travel enthusiast 🏍️',
          ],
        ),
        rightBuilder: (context) => FractionallySizedBox(
          widthFactor: 0.7,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Image.asset('assets/about_me.jpeg', fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
