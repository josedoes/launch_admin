import 'package:code_learn/ui/ui_public.dart';
import 'package:flutter/cupertino.dart';

class PaddingCommon extends StatelessWidget {
  const PaddingCommon({required this.child, required this.isMobile, Key? key})
      : super(key: key);

  final Widget child;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? PaddingCommonMobile(child: child)
        : PaddingCommonDesktop(child: child);
  }
}

class PaddingCommonDesktop extends StatelessWidget {
  const PaddingCommonDesktop({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: insetsHorizontalDesktop,
      child: child,
    );
  }
}

class PaddingCommonMobile extends StatelessWidget {
  const PaddingCommonMobile({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: insetsHorizontal,
      child: child,
    );
  }
}

class HeaderMobileSpace extends StatelessWidget {
  const HeaderMobileSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 54);
  }
}

class FooterMobileSpace extends StatelessWidget {
  const FooterMobileSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 32);
  }
}
