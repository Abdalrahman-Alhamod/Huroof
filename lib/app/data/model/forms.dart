import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'forms.freezed.dart';
part 'forms.g.dart';

@freezed
abstract class Forms with _$Forms {
  const factory Forms({
    @JsonKey(name: 'isolated') String? isolated,
    @JsonKey(name: 'initial') String? initial,
    @JsonKey(name: 'medial') String? medial,
    @JsonKey(name: 'final') String? finalProperty,
  }) = _Forms;

  factory Forms.fromJson(Map<String, Object?> json) => _$FormsFromJson(json);
}
