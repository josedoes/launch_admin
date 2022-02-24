import 'package:code_learn/launch.dart';
import 'package:firebase_database/firebase_database.dart';

class RealtimeDatabaseService {
  static final firebase = FirebaseDatabase.instance;
  static final ref = firebase.ref();

  static Future<void> update(String ref, Map<String, Object?> value) async {
    await firebase.ref(ref).update(value);
  }

  static Future<void> createUser({required String uid}) async {
    await ref.child('user-permissions').child(uid).update(
      {'admin': false},
    );
  }

  static Future<bool> canSignUp(String uid) async {
    try {
      final result = await ref.child('user-permissions').child(uid).get();
      final value = result.value as Map<String, dynamic>;
      return value['admin'] ?? false;
    } catch (e) {
      logError('can sign up $e');
      return false;
    }
  }
}
