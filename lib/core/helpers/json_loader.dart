// lib/services/json_loader.dart
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class JsonLoader {
  /// Dynamically load any list of models from a JSON asset
  static Future<List<T>> loadList<T>(
    String assetPath,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final jsonString = await rootBundle.loadString(assetPath);
    return compute(_parseListJson, _ParseArgs(jsonString, fromJson));
  }
}

/// Helper class to pass arguments into compute isolate
class _ParseArgs<T> {
  final String jsonString;
  final T Function(Map<String, dynamic>) fromJson;
  _ParseArgs(this.jsonString, this.fromJson);
}

/// Isolate-safe parser
List<T> _parseListJson<T>(_ParseArgs<T> args) {
  final List<dynamic> jsonList = json.decode(args.jsonString);
  return jsonList.map((e) => args.fromJson(e as Map<String, dynamic>)).toList();
}
