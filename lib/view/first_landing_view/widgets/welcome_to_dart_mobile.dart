import 'package:code_learn/ui/text_styles.dart';
import 'package:code_learn/view/widgets/clickable_arrow_text.dart';
import 'package:code_learn/view/widgets/common_padding.dart';
import 'package:code_learn/view_models/first_landing_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class WelcomeToDartForBeginnersMobile extends StatelessWidget {
  const WelcomeToDartForBeginnersMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FirstLandingModel>(context, listen: false);

    return PaddingCommonMobile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Welcome to Dart for Beginners!",
            style: landingTitleStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl nibh nulla neque, fermentum euismod lorem suspendisse. \n\nEu, elit viverra tincidunt duis cursus amet, amet. ',
            style: welcomeToDartParagraphStyle,
          ),
          const Spacer(),
          Container(
            height: 60,
            alignment: Alignment.centerRight,
            child: ClickableArrowText(
              onPressed: model.nextPage,
              title: 'Continue',
            ),
          ),
          const SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}
