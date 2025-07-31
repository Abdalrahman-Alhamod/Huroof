// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'letter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Letter implements DiagnosticableTreeMixin {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'letter') String? get letter;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'pronunciation') String? get pronunciation;@JsonKey(name: 'description') String? get description;@JsonKey(name: 'makhraj_image') String? get makhrajImage;@JsonKey(name: 'makhraj_description') String? get makhrajDescription;@JsonKey(name: 'draw_video') String? get drawVideo;@JsonKey(name: 'main_audio') String? get mainAudio;@JsonKey(name: 'forms') Forms? get forms;@JsonKey(name: 'variants') List<Variants>? get variants;
/// Create a copy of Letter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LetterCopyWith<Letter> get copyWith => _$LetterCopyWithImpl<Letter>(this as Letter, _$identity);

  /// Serializes this Letter to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Letter'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('letter', letter))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('pronunciation', pronunciation))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('makhrajImage', makhrajImage))..add(DiagnosticsProperty('makhrajDescription', makhrajDescription))..add(DiagnosticsProperty('drawVideo', drawVideo))..add(DiagnosticsProperty('mainAudio', mainAudio))..add(DiagnosticsProperty('forms', forms))..add(DiagnosticsProperty('variants', variants));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Letter&&(identical(other.id, id) || other.id == id)&&(identical(other.letter, letter) || other.letter == letter)&&(identical(other.name, name) || other.name == name)&&(identical(other.pronunciation, pronunciation) || other.pronunciation == pronunciation)&&(identical(other.description, description) || other.description == description)&&(identical(other.makhrajImage, makhrajImage) || other.makhrajImage == makhrajImage)&&(identical(other.makhrajDescription, makhrajDescription) || other.makhrajDescription == makhrajDescription)&&(identical(other.drawVideo, drawVideo) || other.drawVideo == drawVideo)&&(identical(other.mainAudio, mainAudio) || other.mainAudio == mainAudio)&&(identical(other.forms, forms) || other.forms == forms)&&const DeepCollectionEquality().equals(other.variants, variants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,letter,name,pronunciation,description,makhrajImage,makhrajDescription,drawVideo,mainAudio,forms,const DeepCollectionEquality().hash(variants));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Letter(id: $id, letter: $letter, name: $name, pronunciation: $pronunciation, description: $description, makhrajImage: $makhrajImage, makhrajDescription: $makhrajDescription, drawVideo: $drawVideo, mainAudio: $mainAudio, forms: $forms, variants: $variants)';
}


}

/// @nodoc
abstract mixin class $LetterCopyWith<$Res>  {
  factory $LetterCopyWith(Letter value, $Res Function(Letter) _then) = _$LetterCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'letter') String? letter,@JsonKey(name: 'name') String? name,@JsonKey(name: 'pronunciation') String? pronunciation,@JsonKey(name: 'description') String? description,@JsonKey(name: 'makhraj_image') String? makhrajImage,@JsonKey(name: 'makhraj_description') String? makhrajDescription,@JsonKey(name: 'draw_video') String? drawVideo,@JsonKey(name: 'main_audio') String? mainAudio,@JsonKey(name: 'forms') Forms? forms,@JsonKey(name: 'variants') List<Variants>? variants
});


$FormsCopyWith<$Res>? get forms;

}
/// @nodoc
class _$LetterCopyWithImpl<$Res>
    implements $LetterCopyWith<$Res> {
  _$LetterCopyWithImpl(this._self, this._then);

  final Letter _self;
  final $Res Function(Letter) _then;

/// Create a copy of Letter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? letter = freezed,Object? name = freezed,Object? pronunciation = freezed,Object? description = freezed,Object? makhrajImage = freezed,Object? makhrajDescription = freezed,Object? drawVideo = freezed,Object? mainAudio = freezed,Object? forms = freezed,Object? variants = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,letter: freezed == letter ? _self.letter : letter // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,pronunciation: freezed == pronunciation ? _self.pronunciation : pronunciation // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,makhrajImage: freezed == makhrajImage ? _self.makhrajImage : makhrajImage // ignore: cast_nullable_to_non_nullable
as String?,makhrajDescription: freezed == makhrajDescription ? _self.makhrajDescription : makhrajDescription // ignore: cast_nullable_to_non_nullable
as String?,drawVideo: freezed == drawVideo ? _self.drawVideo : drawVideo // ignore: cast_nullable_to_non_nullable
as String?,mainAudio: freezed == mainAudio ? _self.mainAudio : mainAudio // ignore: cast_nullable_to_non_nullable
as String?,forms: freezed == forms ? _self.forms : forms // ignore: cast_nullable_to_non_nullable
as Forms?,variants: freezed == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<Variants>?,
  ));
}
/// Create a copy of Letter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormsCopyWith<$Res>? get forms {
    if (_self.forms == null) {
    return null;
  }

  return $FormsCopyWith<$Res>(_self.forms!, (value) {
    return _then(_self.copyWith(forms: value));
  });
}
}


/// Adds pattern-matching-related methods to [Letter].
extension LetterPatterns on Letter {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Letter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Letter() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Letter value)  $default,){
final _that = this;
switch (_that) {
case _Letter():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Letter value)?  $default,){
final _that = this;
switch (_that) {
case _Letter() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'letter')  String? letter, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'pronunciation')  String? pronunciation, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'makhraj_image')  String? makhrajImage, @JsonKey(name: 'makhraj_description')  String? makhrajDescription, @JsonKey(name: 'draw_video')  String? drawVideo, @JsonKey(name: 'main_audio')  String? mainAudio, @JsonKey(name: 'forms')  Forms? forms, @JsonKey(name: 'variants')  List<Variants>? variants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Letter() when $default != null:
return $default(_that.id,_that.letter,_that.name,_that.pronunciation,_that.description,_that.makhrajImage,_that.makhrajDescription,_that.drawVideo,_that.mainAudio,_that.forms,_that.variants);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'letter')  String? letter, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'pronunciation')  String? pronunciation, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'makhraj_image')  String? makhrajImage, @JsonKey(name: 'makhraj_description')  String? makhrajDescription, @JsonKey(name: 'draw_video')  String? drawVideo, @JsonKey(name: 'main_audio')  String? mainAudio, @JsonKey(name: 'forms')  Forms? forms, @JsonKey(name: 'variants')  List<Variants>? variants)  $default,) {final _that = this;
switch (_that) {
case _Letter():
return $default(_that.id,_that.letter,_that.name,_that.pronunciation,_that.description,_that.makhrajImage,_that.makhrajDescription,_that.drawVideo,_that.mainAudio,_that.forms,_that.variants);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'letter')  String? letter, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'pronunciation')  String? pronunciation, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'makhraj_image')  String? makhrajImage, @JsonKey(name: 'makhraj_description')  String? makhrajDescription, @JsonKey(name: 'draw_video')  String? drawVideo, @JsonKey(name: 'main_audio')  String? mainAudio, @JsonKey(name: 'forms')  Forms? forms, @JsonKey(name: 'variants')  List<Variants>? variants)?  $default,) {final _that = this;
switch (_that) {
case _Letter() when $default != null:
return $default(_that.id,_that.letter,_that.name,_that.pronunciation,_that.description,_that.makhrajImage,_that.makhrajDescription,_that.drawVideo,_that.mainAudio,_that.forms,_that.variants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Letter with DiagnosticableTreeMixin implements Letter {
  const _Letter({@JsonKey(name: 'id') this.id, @JsonKey(name: 'letter') this.letter, @JsonKey(name: 'name') this.name, @JsonKey(name: 'pronunciation') this.pronunciation, @JsonKey(name: 'description') this.description, @JsonKey(name: 'makhraj_image') this.makhrajImage, @JsonKey(name: 'makhraj_description') this.makhrajDescription, @JsonKey(name: 'draw_video') this.drawVideo, @JsonKey(name: 'main_audio') this.mainAudio, @JsonKey(name: 'forms') this.forms, @JsonKey(name: 'variants') final  List<Variants>? variants}): _variants = variants;
  factory _Letter.fromJson(Map<String, dynamic> json) => _$LetterFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'letter') final  String? letter;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'pronunciation') final  String? pronunciation;
@override@JsonKey(name: 'description') final  String? description;
@override@JsonKey(name: 'makhraj_image') final  String? makhrajImage;
@override@JsonKey(name: 'makhraj_description') final  String? makhrajDescription;
@override@JsonKey(name: 'draw_video') final  String? drawVideo;
@override@JsonKey(name: 'main_audio') final  String? mainAudio;
@override@JsonKey(name: 'forms') final  Forms? forms;
 final  List<Variants>? _variants;
@override@JsonKey(name: 'variants') List<Variants>? get variants {
  final value = _variants;
  if (value == null) return null;
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Letter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LetterCopyWith<_Letter> get copyWith => __$LetterCopyWithImpl<_Letter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LetterToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Letter'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('letter', letter))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('pronunciation', pronunciation))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('makhrajImage', makhrajImage))..add(DiagnosticsProperty('makhrajDescription', makhrajDescription))..add(DiagnosticsProperty('drawVideo', drawVideo))..add(DiagnosticsProperty('mainAudio', mainAudio))..add(DiagnosticsProperty('forms', forms))..add(DiagnosticsProperty('variants', variants));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Letter&&(identical(other.id, id) || other.id == id)&&(identical(other.letter, letter) || other.letter == letter)&&(identical(other.name, name) || other.name == name)&&(identical(other.pronunciation, pronunciation) || other.pronunciation == pronunciation)&&(identical(other.description, description) || other.description == description)&&(identical(other.makhrajImage, makhrajImage) || other.makhrajImage == makhrajImage)&&(identical(other.makhrajDescription, makhrajDescription) || other.makhrajDescription == makhrajDescription)&&(identical(other.drawVideo, drawVideo) || other.drawVideo == drawVideo)&&(identical(other.mainAudio, mainAudio) || other.mainAudio == mainAudio)&&(identical(other.forms, forms) || other.forms == forms)&&const DeepCollectionEquality().equals(other._variants, _variants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,letter,name,pronunciation,description,makhrajImage,makhrajDescription,drawVideo,mainAudio,forms,const DeepCollectionEquality().hash(_variants));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Letter(id: $id, letter: $letter, name: $name, pronunciation: $pronunciation, description: $description, makhrajImage: $makhrajImage, makhrajDescription: $makhrajDescription, drawVideo: $drawVideo, mainAudio: $mainAudio, forms: $forms, variants: $variants)';
}


}

/// @nodoc
abstract mixin class _$LetterCopyWith<$Res> implements $LetterCopyWith<$Res> {
  factory _$LetterCopyWith(_Letter value, $Res Function(_Letter) _then) = __$LetterCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'letter') String? letter,@JsonKey(name: 'name') String? name,@JsonKey(name: 'pronunciation') String? pronunciation,@JsonKey(name: 'description') String? description,@JsonKey(name: 'makhraj_image') String? makhrajImage,@JsonKey(name: 'makhraj_description') String? makhrajDescription,@JsonKey(name: 'draw_video') String? drawVideo,@JsonKey(name: 'main_audio') String? mainAudio,@JsonKey(name: 'forms') Forms? forms,@JsonKey(name: 'variants') List<Variants>? variants
});


@override $FormsCopyWith<$Res>? get forms;

}
/// @nodoc
class __$LetterCopyWithImpl<$Res>
    implements _$LetterCopyWith<$Res> {
  __$LetterCopyWithImpl(this._self, this._then);

  final _Letter _self;
  final $Res Function(_Letter) _then;

/// Create a copy of Letter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? letter = freezed,Object? name = freezed,Object? pronunciation = freezed,Object? description = freezed,Object? makhrajImage = freezed,Object? makhrajDescription = freezed,Object? drawVideo = freezed,Object? mainAudio = freezed,Object? forms = freezed,Object? variants = freezed,}) {
  return _then(_Letter(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,letter: freezed == letter ? _self.letter : letter // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,pronunciation: freezed == pronunciation ? _self.pronunciation : pronunciation // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,makhrajImage: freezed == makhrajImage ? _self.makhrajImage : makhrajImage // ignore: cast_nullable_to_non_nullable
as String?,makhrajDescription: freezed == makhrajDescription ? _self.makhrajDescription : makhrajDescription // ignore: cast_nullable_to_non_nullable
as String?,drawVideo: freezed == drawVideo ? _self.drawVideo : drawVideo // ignore: cast_nullable_to_non_nullable
as String?,mainAudio: freezed == mainAudio ? _self.mainAudio : mainAudio // ignore: cast_nullable_to_non_nullable
as String?,forms: freezed == forms ? _self.forms : forms // ignore: cast_nullable_to_non_nullable
as Forms?,variants: freezed == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<Variants>?,
  ));
}

/// Create a copy of Letter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormsCopyWith<$Res>? get forms {
    if (_self.forms == null) {
    return null;
  }

  return $FormsCopyWith<$Res>(_self.forms!, (value) {
    return _then(_self.copyWith(forms: value));
  });
}
}

// dart format on
