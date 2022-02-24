import 'package:code_learn/launch.dart';
import 'package:code_learn/services/navigator_service/navigator_service.dart';
import 'package:code_learn/view_models/app_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Injector(child: LaunchApp());
  }
}

class LaunchApp extends StatelessWidget {
  const LaunchApp({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp.router(
      routeInformationParser: locate<NavigatorService>().informationParser,
      routerDelegate: locate<NavigatorService>().routerDelegate,
      theme: ThemeData(
          iconTheme: const IconThemeData(
        color: white,
        size: 32,
      )),
      title: 'Launch',
    );
  }
}

class Injector extends StatelessWidget {
  const Injector({required this.child, Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppModel>(
      create: (_) => AppModel()..init(),
      child: child,
    );
  }
}
