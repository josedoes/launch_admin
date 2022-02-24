import 'package:code_learn/view/widgets/rocket_scaffold.dart';
import 'package:code_learn/view_models/app_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PageWrapper extends ViewModelWidget<AppModel> {
  const PageWrapper({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, model) {
    if (model.isBusy) {
      return const PageLoader();
    }
    return child;
  }
}

class PageLoader extends StatelessWidget {
  const PageLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RocketScaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
