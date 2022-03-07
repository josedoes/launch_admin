import 'package:code_learn/launch.dart';
import 'package:code_learn/view/widgets/page_title.dart';
import 'package:code_learn/view/widgets/rocket_scaffold.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RocketScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            PageTitle('Loading'),
            SizedBox(height: 40),
            CircularProgressIndicator(color: white),
            SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
