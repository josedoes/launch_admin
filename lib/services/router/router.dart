import 'dart:convert';

import 'package:code_learn/launch.dart';
import 'package:code_learn/services/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

bool get localHost => kDebugMode ? true : false;

String get baseUrl => localHost
    ? 'http://localhost:80'
    : 'http://ec2-54-210-232-252.compute-1.amazonaws.com';

RocketRouter get router => locate<RocketRouter>();

class RocketRouter {
  AuthService get authService => locate<AuthService>();

  Future<Map<String, String>> getHeader() async => {
        'authorization': 'Bearer ' + (await authService.getToken() ?? ''),
        'Content-Type': 'application/json'
      };

  Future<dynamic> get({required String endpoint}) async {
    try {
      final url = '$baseUrl$endpoint';
      lowLevelLog('Calling get on $url');
      final header = await getHeader();
      debugPrint('with auth ${header['authorization']}');
      final response = await http.get(
        Uri.parse(url),
        headers: header,
      );
      logInfo('response gotten = ${response.body}');
      return jsonDecode(response.body);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<dynamic> post({required String endpoint, Map? body}) async {
    try {
      final url = '$baseUrl$endpoint';
      debugPrint('Calling post on $url');
      final header = await getHeader();
      debugPrint('with auth ${header['authorization']}');
      final response = await http.post(
        Uri.parse(url),
        headers: header,
      );
      logInfo('response gotten = ${response.body}');
      return jsonDecode(response.body);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<dynamic> patch({required String endpoint, String? body}) async {
    try {
      final url = '$baseUrl$endpoint';
      debugPrint('Calling patch on $url');
      final header = await getHeader();
      debugPrint('with auth ${header['authorization']}');
      final response =
          await http.patch(Uri.parse(url), headers: header, body: body);
      logInfo('response gotten = ${response.body}');
      return jsonDecode(response.body);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<dynamic> delete({required String endpoint}) async {
    try {
      final url = '$baseUrl$endpoint';
      debugPrint('Calling delete on $url');
      final header = await getHeader();
      debugPrint('with auth ${header['authorization']}');
      final response = await http.delete(
        Uri.parse(url),
        headers: header,
      );
      logInfo('response gotten = ${response.body}');
      return jsonDecode(response.body);
    } catch (e) {
      logger.e(e);
    }
  }
}
