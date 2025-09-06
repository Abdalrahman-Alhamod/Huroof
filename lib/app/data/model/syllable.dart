import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'syllable.freezed.dart';
part 'syllable.g.dart';

@freezed
abstract class Syllable with _$Syllable {
  const factory Syllable({
    @JsonKey(name: 'key') String? key,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'recording_hint') String? recordingHint,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'audio') String? audio,
  }) = _Syllable;

  factory Syllable.fromJson(Map<String, Object?> json) =>
      _$SyllableFromJson(json);
}
