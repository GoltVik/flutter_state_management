import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_management_presentation/slides/17_mvc_state_management.dart';

import '../slides/0_title.dart';
import '../slides/10_bloc_state_management.dart';
import '../slides/11_bloc_state_management_example.dart';
import '../slides/12_cubit_state_management_example.dart';
import '../slides/13_bloc_init.dart';
import '../slides/14_riverpod_state_management.dart';
import '../slides/15_riverpod_state_management_example.dart';
import '../slides/16_riverpod_init.dart';
import '../slides/18_mvc_state_management_example.dart';
import '../slides/19_mvc_init.dart';
import '../slides/1_about_me.dart';
import '../slides/20_summary.dart';
import '../slides/21_thanks.dart';
import '../slides/2_agenda.dart';
import '../slides/3_state_intro.dart';
import '../slides/4_stateless_widget.dart';
import '../slides/5_stateful_widget.dart';
import '../slides/6_base_life_cycle.dart';
import '../slides/7_state_management.dart';
import '../slides/8_raw_state_management.dart';
import '../slides/9_raw_state_management_example.dart';

class FlutterDeckPresentation extends StatelessWidget {
  const FlutterDeckPresentation({super.key});

  @override
  Widget build(BuildContext context) => FlutterDeckApp(
        configuration: const FlutterDeckConfiguration(
          background: FlutterDeckBackgroundConfiguration(
            light: FlutterDeckBackground.solid(Colors.white),
            dark: FlutterDeckBackground.solid(Color(0xFF16222A)),
          ),
          controls: FlutterDeckControlsConfiguration(
            presenterToolbarVisible: true,
            shortcuts: FlutterDeckShortcutsConfiguration(
              enabled: true,
              nextSlide: SingleActivator(LogicalKeyboardKey.arrowRight),
              previousSlide: SingleActivator(LogicalKeyboardKey.arrowLeft),
              toggleMarker: SingleActivator(
                LogicalKeyboardKey.keyM,
                control: true,
                meta: true,
              ),
              toggleNavigationDrawer: SingleActivator(
                LogicalKeyboardKey.period,
                control: true,
                meta: true,
              ),
            ),
          ),
          footer: FlutterDeckFooterConfiguration(showSlideNumbers: true),
          marker: FlutterDeckMarkerConfiguration(
            color: Colors.red,
            strokeWidth: 8.0,
          ),
          progressIndicator: FlutterDeckProgressIndicator.gradient(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.pink, Colors.purple],
            ),
          ),
          transition: FlutterDeckTransition.fade(),
        ),
        speakerInfo: const FlutterDeckSpeakerInfo(
          name: 'Viktor Goltstein',
          description: 'Software Architect at formigas GmbH',
          socialHandle: 'Github: @VikGolt',
          imagePath: 'assets/me.png',
        ),
        slides: const [
          TitleSlide(),
          AboutMeSlide(),
          AgendaSlide(),
          StateIntroSlide(),
          StatelessWidgetSlide(),
          StatefulWidgetSlide(),
          StateLifecycleSlide(),
          StateManagementSlide(),
          RawStateManagementSlide(),
          RawStateManagementExampleSlide(),
          BlocStateManagementSlide(),
          BlocStateManagementExampleSlide(),
          CubitStateManagementExampleSlide(),
          BlocInitSlide(),
          RiverpodManagementSlide(),
          RiverpodStateManagementExampleSlide(),
          RiverpodInitSlide(),
          MVCManagementSlide(),
          MVCManagementExampleSlide(),
          MVCInitSlide(),
          SummarySlide(),
          ThankYouSlide(),
        ],
      );
}
