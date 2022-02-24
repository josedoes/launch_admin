import 'package:code_learn/view/widgets/rocket_card.dart';
import 'package:flutter/material.dart';

class OutputView extends StatelessWidget {
  const OutputView({required this.output, Key? key}) : super(key: key);

  final String output;

  @override
  Widget build(BuildContext context) {
    return RocketCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
        child: Text(
          output,
        ),
      ),
    );
  }
}
