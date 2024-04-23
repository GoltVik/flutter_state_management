import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String text;

  const TitleWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(62.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: Colors.amber,
            ),
      ),
    );
  }
}
