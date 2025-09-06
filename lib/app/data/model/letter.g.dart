// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'letter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Letter _$LetterFromJson(Map<String, dynamic> json) => _Letter(
  id: (json['id'] as num?)?.toInt(),
  key: json['key'] as String?,
  letter: json['letter'] as String?,
  name: json['name'] as String?,
  pronunciation: json['pronunciation'] as String?,
  description: json['description'] as String?,
  makhrajImage: json['makhraj_image'] as String?,
  makhrajDescription: json['makhraj_description'] as String?,
  drawVideo: json['draw_video'] as String?,
  mainAudio: json['main_audio'] as String?,
  forms:
      json['forms'] == null
          ? null
          : Form.fromJson(json['forms'] as Map<String, dynamic>),
  syllables:
      (json['syllables'] as List<dynamic>?)
          ?.map((e) => Syllable.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$LetterToJson(_Letter instance) => <String, dynamic>{
  'id': instance.id,
  'key': instance.key,
  'letter': instance.letter,
  'name': instance.name,
  'pronunciation': instance.pronunciation,
  'description': instance.description,
  'makhraj_image': instance.makhrajImage,
  'makhraj_description': instance.makhrajDescription,
  'draw_video': instance.drawVideo,
  'main_audio': instance.mainAudio,
  'forms': instance.forms?.toJson(),
  'syllables': instance.syllables?.map((e) => e.toJson()).toList(),
};
