// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variants.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Variants _$VariantsFromJson(Map<String, dynamic> json) => _Variants(
  type: json['type'] as String?,
  text: json['text'] as String?,
  audio: json['audio'] as String?,
  recordingHint: json['recording_hint'] as String?,
);

Map<String, dynamic> _$VariantsToJson(_Variants instance) => <String, dynamic>{
  'type': instance.type,
  'text': instance.text,
  'audio': instance.audio,
  'recording_hint': instance.recordingHint,
};
