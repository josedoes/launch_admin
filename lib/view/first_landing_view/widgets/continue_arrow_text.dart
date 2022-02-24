import 'package:code_learn/view/widgets/clickable_arrow_text.dart';
import 'package:code_learn/view_models/first_landing_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ContinueArrowText extends StatelessWidget {
  const ContinueArrowText({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FirstLandingModel>(context);

    Widget child = Container(
      alignment: Alignment.centerRight,
    );
    if (model.canSubmit) {
      child = Padding(
        padding: const EdgeInsets.only(bottom: 28, top: 28),
        child: ClickableArrowText(
          title: title,
          onPressed: model.navigateToSelection,
        ),
      );
    }

    return child;
  }
}
