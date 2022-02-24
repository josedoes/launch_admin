import 'package:code_learn/launch.dart';
import 'package:code_learn/services/local_storage_service.dart';
import 'package:code_learn/services/realtime_database_service/realtime_database_service.dart';
import 'package:code_learn/services/router/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

AuthService get authService => locate<AuthService>();

class AuthService {
  FirebaseAuth get auth => FirebaseAuth.instance;

  User? get user => auth.currentUser;

  String? get uid => user?.uid;

  bool get isSignedIn => !(user?.isAnonymous ?? true);

  bool? isAdmin;
  bool get isAdminSync => isAdmin ?? false;

  Future<void> init() async {
    isAdmin = (await localStorage.getAuthBox()?.get(uid) ?? false);
  }

  Future<String?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = result.user?.uid;
      if (uid != null) {
        RealtimeDatabaseService.createUser(uid: uid);
      }
      return result.user != null ? null : 'Unexpected error';
    } on FirebaseAuthException catch (e) {
      logError(e.toString());
      return e.message;
    }
  }

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await checkIfAdmin();

      return result.user?.uid;
    } on FirebaseAuthException catch (e) {
      logError(e.toString());
      return '';
    }
  }

  Future<void> signInAnon() async {
    if (user == null) {
      debugPrint('signInAnon');
      final userCredential = await auth.signInAnonymously();
      await auth.currentUser?.reload();
      if (auth.currentUser != null) {
        debugPrint('error signing in anon');
      }
    }
  }

  Future<String?> getToken() async {
    try {
      var token = await auth.currentUser?.getIdToken();
      if (token == null) {
        await auth.currentUser?.reload();
        token = await auth.currentUser?.getIdToken();
      }
      logInfo('getting token = $token');
      return token;
    } catch (e) {
      logError(e.toString());
      return null;
    }
  }

  final authIds = <String, bool>{};

  Future<void> checkIfAdmin() async {
    final uid = this.uid;
    if (uid == null) {
      return;
    }
    try {
      final result = await router.get(endpoint: '/admin/$uid');
      _persistIsAdmin(result['admin'] ?? false);
    } catch (e) {
      logError(e.toString());
    }
  }

  void _persistIsAdmin(bool isAdmin) {
    localStorage.getAuthBox()?.put(uid, isAdmin);
    this.isAdmin = isAdmin;
  }

  Future<void> signOut() async {
    try {
      await localStorage.getAuthBox()?.clear();
      await auth.signOut();
      isAdmin = null;
    } catch (e) {
      logError(e.toString());
    }
  }
}
