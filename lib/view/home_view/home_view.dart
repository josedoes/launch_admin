import 'package:code_learn/view/home_view/widgets/course_manager.dart';
import 'package:code_learn/view/home_view/widgets/logout_button.dart';
import 'package:code_learn/view/widgets/AdminText/text_body.dart';
import 'package:code_learn/view/widgets/app/page_wrapper.dart';
import 'package:code_learn/view/widgets/common_padding.dart';
import 'package:code_learn/view/widgets/rocket_scaffold.dart';
import 'package:code_learn/view_models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeModel>.reactive(
      viewModelBuilder: () => HomeModel()..init(),
      staticChild: const HomeViewContent(),
      builder: (context, model, child) {
        if (model.isBusy) return const PageLoader();
        return child as Widget;
      },
    );
  }
}

class HomeViewContent extends StatelessWidget {
  const HomeViewContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RocketScaffold(
        insideScrollable: false,
        body: PaddingCommonMobile(
          child: Column(
            children: const [
              HeaderMobileSpace(),
              PageTitle('Launch Course Editor. Welcome'),
              SizedBox(height: 60),
              Center(child: CourseManager()),
              Spacer(),
              LogoutButton(),
              FooterMobileSpace(),
            ],
          ),
        ));
  }
}
