import 'package:code_learn/view/widgets/icons/arrow_icon.dart';
import 'package:code_learn/view/widgets/rocket_switcher.dart';
import 'package:flutter/material.dart';

class SendSuffix extends StatelessWidget {
  const SendSuffix(
      {required this.isValid,
      required this.isLoading,
      required this.onSubmit,
      Key? key})
      : super(key: key);

  final bool isValid;
  final bool isLoading;
  final Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    Widget child = Container();
    if (isValid) {
      child = Padding(
        padding: const EdgeInsets.only(right: 24, left: 16),
        child: isLoading
            ? const Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(),
              )
            : ArrowIcon(
                onPressed: onSubmit,
              ),
      );
    } else {
      child = const SizedBox();
    }

    return RocketSwitcher(
      child: child,
      tag: child.runtimeType.toString(),
    );
  }
}
