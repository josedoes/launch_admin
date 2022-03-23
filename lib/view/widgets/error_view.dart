import 'package:code_learn/view/widgets/AdminText/text_body.dart';
import 'package:code_learn/view/widgets/rocket_scaffold.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RocketScaffold(
      body: Center(
        child: PageTitle('There has been an error'),
      ),
    );
  }
}
