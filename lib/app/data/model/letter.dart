import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'forms.dart';
import 'variants.dart';
part 'letter.freezed.dart';
part 'letter.g.dart';

@freezed
abstract class Letter with _$Letter {
  const factory Letter({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'letter') String? letter,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'pronunciation') String? pronunciation,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'makhraj_image') String? makhrajImage,
    @JsonKey(name: 'makhraj_description') String? makhrajDescription,
    @JsonKey(name: 'draw_video') String? drawVideo,
    @JsonKey(name: 'main_audio') String? mainAudio,
    @JsonKey(name: 'forms') Forms? forms,
    @JsonKey(name: 'variants') List<Variants>? variants,
  }) = _Letter;

  factory Letter.fromJson(Map<String, Object?> json) => _$LetterFromJson(json);
}
