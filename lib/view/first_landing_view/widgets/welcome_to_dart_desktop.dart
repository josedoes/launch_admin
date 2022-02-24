import 'package:code_learn/launch.dart';
import 'package:code_learn/view/widgets/icons/arrow_icon.dart';
import 'package:code_learn/view/widgets/span_text.dart';
import 'package:code_learn/view_models/first_landing_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeToDartForBeginnersDesktop extends StatelessWidget {
  const WelcomeToDartForBeginnersDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(
          flex: 10,
        ),
        SpanText(
          style: welcomeToDartStyleDesktop,
          spans: [
            TextSpan(
              text: 'Welcome to',
              style: welcomeToDartStyleDesktop,
            ),
            TextSpan(
              text: ' Dart for Beginners',
              style: welcomeToDartStyleDesktop.copyWith(
                color: rocketBlue,
              ),
            ),
            TextSpan(
              text: '!',
              style: welcomeToDartStyleDesktop,
            ),
          ],
        ),

        const Spacer(
          flex: 2,
        ),

        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl nibh nulla neque, fermentum euismod lorem suspendisse. \n\nEu, elit viverra tincidunt duis cursus amet, amet. ',
          style: welcomeToDartParagraphDesktopStyle,
          textAlign: TextAlign.center,
        ),

        const Spacer(
          flex: 3,
        ),

        const WelcomeToDartDesktopButton(),
        // const Spacer(),
        // Center(child: BaseButton(title: 'Continue', onPressed: () {})),
        const Spacer(
          flex: 9,
        ),
      ],
    );
  }
}

class WelcomeToDartDesktopButton extends StatelessWidget {
  const WelcomeToDartDesktopButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FirstLandingModel>(
      context,
    );
    return ArrowIcon(
        onPressed: () {
          model.nextPage();
        },
        color: rocketBlue);
  }
}
