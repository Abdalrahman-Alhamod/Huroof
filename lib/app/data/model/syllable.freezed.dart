// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'syllable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Syllable implements DiagnosticableTreeMixin {

@JsonKey(name: 'key') String? get key;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'recording_hint') String? get recordingHint;@JsonKey(name: 'text') String? get text;@JsonKey(name: 'audio') String? get audio;
/// Create a copy of Syllable
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyllableCopyWith<Syllable> get copyWith => _$SyllableCopyWithImpl<Syllable>(this as Syllable, _$identity);

  /// Serializes this Syllable to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Syllable'))
    ..add(DiagnosticsProperty('key', key))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('recordingHint', recordingHint))..add(DiagnosticsProperty('text', text))..add(DiagnosticsProperty('audio', audio));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Syllable&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.recordingHint, recordingHint) || other.recordingHint == recordingHint)&&(identical(other.text, text) || other.text == text)&&(identical(other.audio, audio) || other.audio == audio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,recordingHint,text,audio);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Syllable(key: $key, name: $name, recordingHint: $recordingHint, text: $text, audio: $audio)';
}


}

/// @nodoc
abstract mixin class $SyllableCopyWith<$Res>  {
  factory $SyllableCopyWith(Syllable value, $Res Function(Syllable) _then) = _$SyllableCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'key') String? key,@JsonKey(name: 'name') String? name,@JsonKey(name: 'recording_hint') String? recordingHint,@JsonKey(name: 'text') String? text,@JsonKey(name: 'audio') String? audio
});




}
/// @nodoc
class _$SyllableCopyWithImpl<$Res>
    implements $SyllableCopyWith<$Res> {
  _$SyllableCopyWithImpl(this._self, this._then);

  final Syllable _self;
  final $Res Function(Syllable) _then;

/// Create a copy of Syllable
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = freezed,Object? name = freezed,Object? recordingHint = freezed,Object? text = freezed,Object? audio = freezed,}) {
  return _then(_self.copyWith(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,recordingHint: freezed == recordingHint ? _self.recordingHint : recordingHint // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,audio: freezed == audio ? _self.audio : audio // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Syllable].
extension SyllablePatterns on Syllable {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Syllable value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Syllable() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Syllable value)  $default,){
final _that = this;
switch (_that) {
case _Syllable():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Syllable value)?  $default,){
final _that = this;
switch (_that) {
case _Syllable() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'key')  String? key, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'recording_hint')  String? recordingHint, @JsonKey(name: 'text')  String? text, @JsonKey(name: 'audio')  String? audio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Syllable() when $default != null:
return $default(_that.key,_that.name,_that.recordingHint,_that.text,_that.audio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'key')  String? key, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'recording_hint')  String? recordingHint, @JsonKey(name: 'text')  String? text, @JsonKey(name: 'audio')  String? audio)  $default,) {final _that = this;
switch (_that) {
case _Syllable():
return $default(_that.key,_that.name,_that.recordingHint,_that.text,_that.audio);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'key')  String? key, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'recording_hint')  String? recordingHint, @JsonKey(name: 'text')  String? text, @JsonKey(name: 'audio')  String? audio)?  $default,) {final _that = this;
switch (_that) {
case _Syllable() when $default != null:
return $default(_that.key,_that.name,_that.recordingHint,_that.text,_that.audio);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Syllable with DiagnosticableTreeMixin implements Syllable {
  const _Syllable({@JsonKey(name: 'key') this.key, @JsonKey(name: 'name') this.name, @JsonKey(name: 'recording_hint') this.recordingHint, @JsonKey(name: 'text') this.text, @JsonKey(name: 'audio') this.audio});
  factory _Syllable.fromJson(Map<String, dynamic> json) => _$SyllableFromJson(json);

@override@JsonKey(name: 'key') final  String? key;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'recording_hint') final  String? recordingHint;
@override@JsonKey(name: 'text') final  String? text;
@override@JsonKey(name: 'audio') final  String? audio;

/// Create a copy of Syllable
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyllableCopyWith<_Syllable> get copyWith => __$SyllableCopyWithImpl<_Syllable>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SyllableToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Syllable'))
    ..add(DiagnosticsProperty('key', key))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('recordingHint', recordingHint))..add(DiagnosticsProperty('text', text))..add(DiagnosticsProperty('audio', audio));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Syllable&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.recordingHint, recordingHint) || other.recordingHint == recordingHint)&&(identical(other.text, text) || other.text == text)&&(identical(other.audio, audio) || other.audio == audio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,recordingHint,text,audio);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Syllable(key: $key, name: $name, recordingHint: $recordingHint, text: $text, audio: $audio)';
}


}

/// @nodoc
abstract mixin class _$SyllableCopyWith<$Res> implements $SyllableCopyWith<$Res> {
  factory _$SyllableCopyWith(_Syllable value, $Res Function(_Syllable) _then) = __$SyllableCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'key') String? key,@JsonKey(name: 'name') String? name,@JsonKey(name: 'recording_hint') String? recordingHint,@JsonKey(name: 'text') String? text,@JsonKey(name: 'audio') String? audio
});




}
/// @nodoc
class __$SyllableCopyWithImpl<$Res>
    implements _$SyllableCopyWith<$Res> {
  __$SyllableCopyWithImpl(this._self, this._then);

  final _Syllable _self;
  final $Res Function(_Syllable) _then;

/// Create a copy of Syllable
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = freezed,Object? name = freezed,Object? recordingHint = freezed,Object? text = freezed,Object? audio = freezed,}) {
  return _then(_Syllable(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,recordingHint: freezed == recordingHint ? _self.recordingHint : recordingHint // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,audio: freezed == audio ? _self.audio : audio // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
