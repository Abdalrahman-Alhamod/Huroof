import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'submit_response.freezed.dart';
part 'submit_response.g.dart';

@freezed
abstract class SubmitResponse with _$SubmitResponse {
  const factory SubmitResponse({
    @JsonKey(name: 'letter_key') String? letterKey,
    @JsonKey(name: 'syllable_key') String? syllableKey,
    @JsonKey(name: 'result') double? result,
  }) = _SubmitResponse;

  factory SubmitResponse.fromJson(Map<String, Object?> json) =>
      _$SubmitResponseFromJson(json);
}
