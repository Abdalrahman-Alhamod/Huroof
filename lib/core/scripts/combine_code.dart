import 'dart:io';

import 'package:flutter/foundation.dart';

void main() async {
  final rootDir = Directory.current;
  final outputFile = File('code.txt');
  final sink = outputFile.openWrite();

  await for (var entity in rootDir.list(recursive: true, followLinks: false)) {
    if (entity is File &&
        (entity.path.endsWith('.dart') || entity.path.endsWith('.yaml'))) {
      final relativePath = entity.uri.pathSegments.last;
      final contents = await entity.readAsString();

      sink.writeln('\n\n// ========================');
      sink.writeln('// File: $relativePath');
      sink.writeln('// ========================\n');
      sink.writeln(contents);
    }
  }

  await sink.flush();
  await sink.close();
  if (kDebugMode) {
    print('✅ All Dart and yaml files have been combined into code.txt');
  }
}
