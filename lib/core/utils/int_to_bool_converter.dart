import 'package:freezed_annotation/freezed_annotation.dart';

class IntToBoolConverter implements JsonConverter<bool?, dynamic> {
  const IntToBoolConverter();

  @override
  bool? fromJson(dynamic json) {
    if (json is bool) return json;
    if (json is int) return json == 1;
    if (json is String) return json == '1' || json.toLowerCase() == 'true';
    return null; // return null if the type is not recognized
  }

  @override
  dynamic toJson(bool? object) => object ?? false ? 1 : 0; // Default to 0 if null
}
