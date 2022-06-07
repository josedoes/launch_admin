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
    super.key
  }) ;

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

    Widget child = Container(
      // color: backgroundColor ?? appBackgroundColor,
      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment(0.01, 1.8),
      //     colors: [
      //       Color(0xff161B4C),
      //       Color(0xff3E4697),
      //     ],
      //   ),
      // ),
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
        backgroundColor: Colors.transparent,
        onEndDrawerChanged: onEndDrawerChanged,
        body: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 900,
              ),
              child: body,
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

    final fadeIn = false;

    if(fadeIn){
      // child = FadeIn(child: child);
    }

    return child;
  }
}

class AppBackground extends StatelessWidget {
  const AppBackground({required this.child, super.key,}) ;

  final Widget child;

  // Figma Flutter Gxenerator Rectangle289Widget - RECTANGLE



  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      // color: backgroundColor ?? appBackgroundColor,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromRGBO(21, 27, 75, 1),Color.fromRGBO(31, 41, 125, 1)]
        ),
      ),
      child: child,
    );
  }
}
