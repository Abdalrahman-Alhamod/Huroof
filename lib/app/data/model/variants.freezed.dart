// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'variants.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Variants implements DiagnosticableTreeMixin {

@JsonKey(name: 'type') String? get type;@JsonKey(name: 'text') String? get text;@JsonKey(name: 'audio') String? get audio;@JsonKey(name: 'recording_hint') String? get recordingHint;
/// Create a copy of Variants
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VariantsCopyWith<Variants> get copyWith => _$VariantsCopyWithImpl<Variants>(this as Variants, _$identity);

  /// Serializes this Variants to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Variants'))
    ..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('text', text))..add(DiagnosticsProperty('audio', audio))..add(DiagnosticsProperty('recordingHint', recordingHint));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Variants&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text)&&(identical(other.audio, audio) || other.audio == audio)&&(identical(other.recordingHint, recordingHint) || other.recordingHint == recordingHint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,text,audio,recordingHint);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Variants(type: $type, text: $text, audio: $audio, recordingHint: $recordingHint)';
}


}

/// @nodoc
abstract mixin class $VariantsCopyWith<$Res>  {
  factory $VariantsCopyWith(Variants value, $Res Function(Variants) _then) = _$VariantsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'type') String? type,@JsonKey(name: 'text') String? text,@JsonKey(name: 'audio') String? audio,@JsonKey(name: 'recording_hint') String? recordingHint
});




}
/// @nodoc
class _$VariantsCopyWithImpl<$Res>
    implements $VariantsCopyWith<$Res> {
  _$VariantsCopyWithImpl(this._self, this._then);

  final Variants _self;
  final $Res Function(Variants) _then;

/// Create a copy of Variants
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? text = freezed,Object? audio = freezed,Object? recordingHint = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,audio: freezed == audio ? _self.audio : audio // ignore: cast_nullable_to_non_nullable
as String?,recordingHint: freezed == recordingHint ? _self.recordingHint : recordingHint // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Variants].
extension VariantsPatterns on Variants {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Variants value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Variants() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Variants value)  $default,){
final _that = this;
switch (_that) {
case _Variants():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Variants value)?  $default,){
final _that = this;
switch (_that) {
case _Variants() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'type')  String? type, @JsonKey(name: 'text')  String? text, @JsonKey(name: 'audio')  String? audio, @JsonKey(name: 'recording_hint')  String? recordingHint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Variants() when $default != null:
return $default(_that.type,_that.text,_that.audio,_that.recordingHint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'type')  String? type, @JsonKey(name: 'text')  String? text, @JsonKey(name: 'audio')  String? audio, @JsonKey(name: 'recording_hint')  String? recordingHint)  $default,) {final _that = this;
switch (_that) {
case _Variants():
return $default(_that.type,_that.text,_that.audio,_that.recordingHint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'type')  String? type, @JsonKey(name: 'text')  String? text, @JsonKey(name: 'audio')  String? audio, @JsonKey(name: 'recording_hint')  String? recordingHint)?  $default,) {final _that = this;
switch (_that) {
case _Variants() when $default != null:
return $default(_that.type,_that.text,_that.audio,_that.recordingHint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Variants with DiagnosticableTreeMixin implements Variants {
  const _Variants({@JsonKey(name: 'type') this.type, @JsonKey(name: 'text') this.text, @JsonKey(name: 'audio') this.audio, @JsonKey(name: 'recording_hint') this.recordingHint});
  factory _Variants.fromJson(Map<String, dynamic> json) => _$VariantsFromJson(json);

@override@JsonKey(name: 'type') final  String? type;
@override@JsonKey(name: 'text') final  String? text;
@override@JsonKey(name: 'audio') final  String? audio;
@override@JsonKey(name: 'recording_hint') final  String? recordingHint;

/// Create a copy of Variants
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VariantsCopyWith<_Variants> get copyWith => __$VariantsCopyWithImpl<_Variants>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VariantsToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Variants'))
    ..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('text', text))..add(DiagnosticsProperty('audio', audio))..add(DiagnosticsProperty('recordingHint', recordingHint));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Variants&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text)&&(identical(other.audio, audio) || other.audio == audio)&&(identical(other.recordingHint, recordingHint) || other.recordingHint == recordingHint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,text,audio,recordingHint);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Variants(type: $type, text: $text, audio: $audio, recordingHint: $recordingHint)';
}


}

/// @nodoc
abstract mixin class _$VariantsCopyWith<$Res> implements $VariantsCopyWith<$Res> {
  factory _$VariantsCopyWith(_Variants value, $Res Function(_Variants) _then) = __$VariantsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'type') String? type,@JsonKey(name: 'text') String? text,@JsonKey(name: 'audio') String? audio,@JsonKey(name: 'recording_hint') String? recordingHint
});




}
/// @nodoc
class __$VariantsCopyWithImpl<$Res>
    implements _$VariantsCopyWith<$Res> {
  __$VariantsCopyWithImpl(this._self, this._then);

  final _Variants _self;
  final $Res Function(_Variants) _then;

/// Create a copy of Variants
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? text = freezed,Object? audio = freezed,Object? recordingHint = freezed,}) {
  return _then(_Variants(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,audio: freezed == audio ? _self.audio : audio // ignore: cast_nullable_to_non_nullable
as String?,recordingHint: freezed == recordingHint ? _self.recordingHint : recordingHint // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
