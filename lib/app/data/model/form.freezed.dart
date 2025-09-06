// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Form implements DiagnosticableTreeMixin {

@JsonKey(name: 'isolated') String? get isolated;@JsonKey(name: 'initial') String? get initial;@JsonKey(name: 'medial') String? get medial;@JsonKey(name: 'final') String? get finalProperty;
/// Create a copy of Form
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormCopyWith<Form> get copyWith => _$FormCopyWithImpl<Form>(this as Form, _$identity);

  /// Serializes this Form to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Form'))
    ..add(DiagnosticsProperty('isolated', isolated))..add(DiagnosticsProperty('initial', initial))..add(DiagnosticsProperty('medial', medial))..add(DiagnosticsProperty('finalProperty', finalProperty));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Form&&(identical(other.isolated, isolated) || other.isolated == isolated)&&(identical(other.initial, initial) || other.initial == initial)&&(identical(other.medial, medial) || other.medial == medial)&&(identical(other.finalProperty, finalProperty) || other.finalProperty == finalProperty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isolated,initial,medial,finalProperty);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Form(isolated: $isolated, initial: $initial, medial: $medial, finalProperty: $finalProperty)';
}


}

/// @nodoc
abstract mixin class $FormCopyWith<$Res>  {
  factory $FormCopyWith(Form value, $Res Function(Form) _then) = _$FormCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'isolated') String? isolated,@JsonKey(name: 'initial') String? initial,@JsonKey(name: 'medial') String? medial,@JsonKey(name: 'final') String? finalProperty
});




}
/// @nodoc
class _$FormCopyWithImpl<$Res>
    implements $FormCopyWith<$Res> {
  _$FormCopyWithImpl(this._self, this._then);

  final Form _self;
  final $Res Function(Form) _then;

/// Create a copy of Form
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isolated = freezed,Object? initial = freezed,Object? medial = freezed,Object? finalProperty = freezed,}) {
  return _then(_self.copyWith(
isolated: freezed == isolated ? _self.isolated : isolated // ignore: cast_nullable_to_non_nullable
as String?,initial: freezed == initial ? _self.initial : initial // ignore: cast_nullable_to_non_nullable
as String?,medial: freezed == medial ? _self.medial : medial // ignore: cast_nullable_to_non_nullable
as String?,finalProperty: freezed == finalProperty ? _self.finalProperty : finalProperty // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Form].
extension FormPatterns on Form {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Form value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Form() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Form value)  $default,){
final _that = this;
switch (_that) {
case _Form():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Form value)?  $default,){
final _that = this;
switch (_that) {
case _Form() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'isolated')  String? isolated, @JsonKey(name: 'initial')  String? initial, @JsonKey(name: 'medial')  String? medial, @JsonKey(name: 'final')  String? finalProperty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Form() when $default != null:
return $default(_that.isolated,_that.initial,_that.medial,_that.finalProperty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'isolated')  String? isolated, @JsonKey(name: 'initial')  String? initial, @JsonKey(name: 'medial')  String? medial, @JsonKey(name: 'final')  String? finalProperty)  $default,) {final _that = this;
switch (_that) {
case _Form():
return $default(_that.isolated,_that.initial,_that.medial,_that.finalProperty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'isolated')  String? isolated, @JsonKey(name: 'initial')  String? initial, @JsonKey(name: 'medial')  String? medial, @JsonKey(name: 'final')  String? finalProperty)?  $default,) {final _that = this;
switch (_that) {
case _Form() when $default != null:
return $default(_that.isolated,_that.initial,_that.medial,_that.finalProperty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Form with DiagnosticableTreeMixin implements Form {
  const _Form({@JsonKey(name: 'isolated') this.isolated, @JsonKey(name: 'initial') this.initial, @JsonKey(name: 'medial') this.medial, @JsonKey(name: 'final') this.finalProperty});
  factory _Form.fromJson(Map<String, dynamic> json) => _$FormFromJson(json);

@override@JsonKey(name: 'isolated') final  String? isolated;
@override@JsonKey(name: 'initial') final  String? initial;
@override@JsonKey(name: 'medial') final  String? medial;
@override@JsonKey(name: 'final') final  String? finalProperty;

/// Create a copy of Form
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormCopyWith<_Form> get copyWith => __$FormCopyWithImpl<_Form>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Form'))
    ..add(DiagnosticsProperty('isolated', isolated))..add(DiagnosticsProperty('initial', initial))..add(DiagnosticsProperty('medial', medial))..add(DiagnosticsProperty('finalProperty', finalProperty));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Form&&(identical(other.isolated, isolated) || other.isolated == isolated)&&(identical(other.initial, initial) || other.initial == initial)&&(identical(other.medial, medial) || other.medial == medial)&&(identical(other.finalProperty, finalProperty) || other.finalProperty == finalProperty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isolated,initial,medial,finalProperty);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Form(isolated: $isolated, initial: $initial, medial: $medial, finalProperty: $finalProperty)';
}


}

/// @nodoc
abstract mixin class _$FormCopyWith<$Res> implements $FormCopyWith<$Res> {
  factory _$FormCopyWith(_Form value, $Res Function(_Form) _then) = __$FormCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'isolated') String? isolated,@JsonKey(name: 'initial') String? initial,@JsonKey(name: 'medial') String? medial,@JsonKey(name: 'final') String? finalProperty
});




}
/// @nodoc
class __$FormCopyWithImpl<$Res>
    implements _$FormCopyWith<$Res> {
  __$FormCopyWithImpl(this._self, this._then);

  final _Form _self;
  final $Res Function(_Form) _then;

/// Create a copy of Form
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isolated = freezed,Object? initial = freezed,Object? medial = freezed,Object? finalProperty = freezed,}) {
  return _then(_Form(
isolated: freezed == isolated ? _self.isolated : isolated // ignore: cast_nullable_to_non_nullable
as String?,initial: freezed == initial ? _self.initial : initial // ignore: cast_nullable_to_non_nullable
as String?,medial: freezed == medial ? _self.medial : medial // ignore: cast_nullable_to_non_nullable
as String?,finalProperty: freezed == finalProperty ? _self.finalProperty : finalProperty // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
