// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syllable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Syllable _$SyllableFromJson(Map<String, dynamic> json) => _Syllable(
  key: json['key'] as String?,
  name: json['name'] as String?,
  recordingHint: json['recording_hint'] as String?,
  text: json['text'] as String?,
  audio: json['audio'] as String?,
);

Map<String, dynamic> _$SyllableToJson(_Syllable instance) => <String, dynamic>{
  'key': instance.key,
  'name': instance.name,
  'recording_hint': instance.recordingHint,
  'text': instance.text,
  'audio': instance.audio,
};
