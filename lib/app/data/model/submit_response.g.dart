// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubmitResponse _$SubmitResponseFromJson(Map<String, dynamic> json) =>
    _SubmitResponse(
      letterKey: json['letter_key'] as String?,
      syllableKey: json['syllable_key'] as String?,
      result: (json['result'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SubmitResponseToJson(_SubmitResponse instance) =>
    <String, dynamic>{
      'letter_key': instance.letterKey,
      'syllable_key': instance.syllableKey,
      'result': instance.result,
    };
