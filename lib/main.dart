import 'package:code_learn/launch.dart';
import 'package:code_learn/view/app_view/app_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await configureApp();
    runApp(
      const AppView(),
    );
  } catch (e) {
    logger.e('error in main $e');
  }
}

Future<void> configureApp() async {
  await initFirebase();
  await setUpLocator();
  setUrlStrategy(
    PathUrlStrategy(),
  );
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        projectId: 'launch-9f264',
        apiKey: 'AIzaSyDaCq8SmeBCh7fS8RPz4Ix0KcwgggJ5qFs',
        messagingSenderId: '364553785129',
        appId: '1:364553785129:web:0d19ed795277142eae7138',
        databaseURL: 'https://launch-9f264-default-rtdb.firebaseio.com/'),
  );
}
