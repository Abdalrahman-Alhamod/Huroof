// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubmitResponse implements DiagnosticableTreeMixin {

@JsonKey(name: 'letter_key') String? get letterKey;@JsonKey(name: 'syllable_key') String? get syllableKey;@JsonKey(name: 'result') double? get result;
/// Create a copy of SubmitResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitResponseCopyWith<SubmitResponse> get copyWith => _$SubmitResponseCopyWithImpl<SubmitResponse>(this as SubmitResponse, _$identity);

  /// Serializes this SubmitResponse to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SubmitResponse'))
    ..add(DiagnosticsProperty('letterKey', letterKey))..add(DiagnosticsProperty('syllableKey', syllableKey))..add(DiagnosticsProperty('result', result));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitResponse&&(identical(other.letterKey, letterKey) || other.letterKey == letterKey)&&(identical(other.syllableKey, syllableKey) || other.syllableKey == syllableKey)&&(identical(other.result, result) || other.result == result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,letterKey,syllableKey,result);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SubmitResponse(letterKey: $letterKey, syllableKey: $syllableKey, result: $result)';
}


}

/// @nodoc
abstract mixin class $SubmitResponseCopyWith<$Res>  {
  factory $SubmitResponseCopyWith(SubmitResponse value, $Res Function(SubmitResponse) _then) = _$SubmitResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'letter_key') String? letterKey,@JsonKey(name: 'syllable_key') String? syllableKey,@JsonKey(name: 'result') double? result
});




}
/// @nodoc
class _$SubmitResponseCopyWithImpl<$Res>
    implements $SubmitResponseCopyWith<$Res> {
  _$SubmitResponseCopyWithImpl(this._self, this._then);

  final SubmitResponse _self;
  final $Res Function(SubmitResponse) _then;

/// Create a copy of SubmitResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? letterKey = freezed,Object? syllableKey = freezed,Object? result = freezed,}) {
  return _then(_self.copyWith(
letterKey: freezed == letterKey ? _self.letterKey : letterKey // ignore: cast_nullable_to_non_nullable
as String?,syllableKey: freezed == syllableKey ? _self.syllableKey : syllableKey // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmitResponse].
extension SubmitResponsePatterns on SubmitResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmitResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmitResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmitResponse value)  $default,){
final _that = this;
switch (_that) {
case _SubmitResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmitResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SubmitResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'letter_key')  String? letterKey, @JsonKey(name: 'syllable_key')  String? syllableKey, @JsonKey(name: 'result')  double? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmitResponse() when $default != null:
return $default(_that.letterKey,_that.syllableKey,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'letter_key')  String? letterKey, @JsonKey(name: 'syllable_key')  String? syllableKey, @JsonKey(name: 'result')  double? result)  $default,) {final _that = this;
switch (_that) {
case _SubmitResponse():
return $default(_that.letterKey,_that.syllableKey,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'letter_key')  String? letterKey, @JsonKey(name: 'syllable_key')  String? syllableKey, @JsonKey(name: 'result')  double? result)?  $default,) {final _that = this;
switch (_that) {
case _SubmitResponse() when $default != null:
return $default(_that.letterKey,_that.syllableKey,_that.result);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubmitResponse with DiagnosticableTreeMixin implements SubmitResponse {
  const _SubmitResponse({@JsonKey(name: 'letter_key') this.letterKey, @JsonKey(name: 'syllable_key') this.syllableKey, @JsonKey(name: 'result') this.result});
  factory _SubmitResponse.fromJson(Map<String, dynamic> json) => _$SubmitResponseFromJson(json);

@override@JsonKey(name: 'letter_key') final  String? letterKey;
@override@JsonKey(name: 'syllable_key') final  String? syllableKey;
@override@JsonKey(name: 'result') final  double? result;

/// Create a copy of SubmitResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitResponseCopyWith<_SubmitResponse> get copyWith => __$SubmitResponseCopyWithImpl<_SubmitResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmitResponseToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SubmitResponse'))
    ..add(DiagnosticsProperty('letterKey', letterKey))..add(DiagnosticsProperty('syllableKey', syllableKey))..add(DiagnosticsProperty('result', result));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitResponse&&(identical(other.letterKey, letterKey) || other.letterKey == letterKey)&&(identical(other.syllableKey, syllableKey) || other.syllableKey == syllableKey)&&(identical(other.result, result) || other.result == result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,letterKey,syllableKey,result);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SubmitResponse(letterKey: $letterKey, syllableKey: $syllableKey, result: $result)';
}


}

/// @nodoc
abstract mixin class _$SubmitResponseCopyWith<$Res> implements $SubmitResponseCopyWith<$Res> {
  factory _$SubmitResponseCopyWith(_SubmitResponse value, $Res Function(_SubmitResponse) _then) = __$SubmitResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'letter_key') String? letterKey,@JsonKey(name: 'syllable_key') String? syllableKey,@JsonKey(name: 'result') double? result
});




}
/// @nodoc
class __$SubmitResponseCopyWithImpl<$Res>
    implements _$SubmitResponseCopyWith<$Res> {
  __$SubmitResponseCopyWithImpl(this._self, this._then);

  final _SubmitResponse _self;
  final $Res Function(_SubmitResponse) _then;

/// Create a copy of SubmitResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? letterKey = freezed,Object? syllableKey = freezed,Object? result = freezed,}) {
  return _then(_SubmitResponse(
letterKey: freezed == letterKey ? _self.letterKey : letterKey // ignore: cast_nullable_to_non_nullable
as String?,syllableKey: freezed == syllableKey ? _self.syllableKey : syllableKey // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
