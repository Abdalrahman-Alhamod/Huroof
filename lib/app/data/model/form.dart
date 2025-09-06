import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'form.freezed.dart';
part 'form.g.dart';

@freezed
abstract class Form with _$Form {
  const factory Form({
    @JsonKey(name: 'isolated') String? isolated,
    @JsonKey(name: 'initial') String? initial,
    @JsonKey(name: 'medial') String? medial,
    @JsonKey(name: 'final') String? finalProperty,
  }) = _Form;

  factory Form.fromJson(Map<String, Object?> json) => _$FormFromJson(json);
}
