import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(),
);

void logError(e, {stackTrace}) {
  logger.e("Error! $e", stackTrace?.toString());
}

void logInfo(String info) {
  logger.i(info);
}

void lowLevelLog(String info) {
  debugPrint(info);
}
