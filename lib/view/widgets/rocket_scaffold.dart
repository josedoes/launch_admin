import 'package:code_learn/ui/colors.dart';
import 'package:code_learn/view/app_view/app_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RocketScaffold extends StatelessWidget {
  const RocketScaffold({
    required this.body,
    this.endDrawer,
    this.insideScrollable = false,
    this.version,
    this.debugTag,
    this.onEndDrawerChanged,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.floatingActionButton,
    this.drawerScrimColor = Colors.transparent,
    this.floatingActionButtonLocation,
    Key? key,
  }) : super(key: key);

  final bool insideScrollable;
  final String? version;
  final Widget body;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final Color? drawerScrimColor;
  final String? debugTag;
  final bool resizeToAvoidBottomInset;
  final DrawerCallback? onEndDrawerChanged;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    debugPrint('${debugTag ?? body.runtimeType} Built with RocketScaffold');

    Widget child = Container(
      color: backgroundColor ?? appBackgroundColor,
      child: Scaffold(
        drawerScrimColor: drawerScrimColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: PreferredSize(
          child: Container(
            color: Colors.transparent,
          ),
          preferredSize: kIsWeb ? const Size(0, 0) : const Size.fromHeight(0),
        ),
        endDrawer: endDrawer,
        backgroundColor: backgroundColor ?? appBackgroundColor,
        onEndDrawerChanged: onEndDrawerChanged,
        body: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: FadeIn(
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 800,
                ),
                child: body,
              ),
            ),
          ),
        ),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
      ),
    );

    if (insideScrollable) {
      child = SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: child,
        ),
      );
    }

    return child;
  }
}
