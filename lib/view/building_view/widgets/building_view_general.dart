import 'package:code_learn/ui/text_styles.dart';
import 'package:code_learn/view/widgets/base_text_field.dart';
import 'package:code_learn/view/widgets/general_suffix_submit.dart';
import 'package:code_learn/view/widgets/icons/rocket_icon.dart';
import 'package:code_learn/view/widgets/rocket_switcher.dart';
import 'package:code_learn/view_models/building_view_model.dart';
import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountDown extends StatelessWidget {
  const CountDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountDownText(
      due: DateTime(2022, 02, 02),
      finishedText: "Its time to launch!",
      showLabel: false,
      longDateName: false,
      style: title1Style,
    );
  }
}

class RocketAndCountDown extends StatelessWidget {
  const RocketAndCountDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        Expanded(
          child: Transform.translate(
            offset: const Offset(0, 60),
            child: const RocketIcon(),
          ),
        ),
        const CountDown(),
        const SizedBox(height: 80),
      ],
    );
  }
}

class StayTuned extends StatelessWidget {
  const StayTuned({required this.isMobile, Key? key}) : super(key: key);
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: EdgeInsets.only(left: isMobile ? 24 : 50),
          child: Text('Launch', style: launchTitleStyle),
        ),
        const Spacer(
          flex: 10,
        ),
        _DefaultPadding(
          isMobile: isMobile,
          child: Text(
            'We’re currently preparing for take off.',
            style: title1Style,
          ),
        ),
        const Spacer(flex: 10),
        AskingForEmail(isMobile: isMobile),
        const Spacer(flex: 15),
      ],
    );
  }
}

class AskingForEmail extends StatelessWidget {
  const AskingForEmail({required this.isMobile, Key? key}) : super(key: key);
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<BuildingModel>(context);

    Widget child = Container();
    if (model.state == BuildingState.success) {
      child = successState();
    } else {
      child = initialState(model, model.state);
    }

    return RocketSwitcher(
      child: child,
    );
  }

  Widget successState() {
    return _DefaultPadding(
      isMobile: isMobile,
      child: Text(
        'Thanks!',
        style: title2Style,
      ),
    );
  }

  Widget initialState(BuildingModel model, BuildingState state) {
    final isLoading = state == BuildingState.loading;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DefaultPadding(
          isMobile: isMobile,
          child: Text(
            'Stay tuned for more.',
            style: title2Style.copyWith(
              fontSize: isMobile ? 18 : null,
            ),
          ),
        ),
        const SizedBox(height: 16),
        _DefaultPadding(
          isMobile: isMobile,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            child: BaseTextField(
              controller: model.emailController,
              hintText: 'jose@josedoes.com',
              suffix: SendSuffix(
                isLoading: isLoading,
                isValid: model.emailIsValid(),
                onSubmit: model.onSubmitEmail,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DefaultPadding extends StatelessWidget {
  const _DefaultPadding({required this.isMobile, required this.child, Key? key})
      : super(key: key);
  final Widget child;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: isMobile ? 24 : 106.0),
      child: child,
    );
  }
}
