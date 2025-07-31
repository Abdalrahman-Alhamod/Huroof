import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'variants.freezed.dart';
part 'variants.g.dart';

@freezed
abstract class Variants with _$Variants {
  const factory Variants({
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'audio') String? audio,
    @JsonKey(name: 'recording_hint') String? recordingHint,
  }) = _Variants;

  factory Variants.fromJson(Map<String, Object?> json) =>
      _$VariantsFromJson(json);
}
