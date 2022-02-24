import 'dart:math' as math;

import 'package:code_learn/services/realtime_database_service/realtime_database_service.dart';
import 'package:flutter/cupertino.dart';

const emailRef = 'email_list';

class EmailListService {
  Future<bool> addEmail(String email) async {
    try {
      await RealtimeDatabaseService.update(emailRef, {
        math.Random().nextInt(999999).toString(): email,
      });
      return true;
    } catch (e) {
      debugPrint('Error in EmailListService $e');
      return false;
    }
  }
}
