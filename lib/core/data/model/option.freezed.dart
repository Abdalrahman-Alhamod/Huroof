// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Option<T> {

 String get label; T get value;
/// Create a copy of Option
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OptionCopyWith<T, Option<T>> get copyWith => _$OptionCopyWithImpl<T, Option<T>>(this as Option<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Option<T>&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,label,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'Option<$T>(label: $label, value: $value)';
}


}

/// @nodoc
abstract mixin class $OptionCopyWith<T,$Res>  {
  factory $OptionCopyWith(Option<T> value, $Res Function(Option<T>) _then) = _$OptionCopyWithImpl;
@useResult
$Res call({
 String label, T value
});




}
/// @nodoc
class _$OptionCopyWithImpl<T,$Res>
    implements $OptionCopyWith<T, $Res> {
  _$OptionCopyWithImpl(this._self, this._then);

  final Option<T> _self;
  final $Res Function(Option<T>) _then;

/// Create a copy of Option
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? value = freezed,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T,
  ));
}

}


/// Adds pattern-matching-related methods to [Option].
extension OptionPatterns<T> on Option<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Option<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Option() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Option<T> value)  $default,){
final _that = this;
switch (_that) {
case _Option():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Option<T> value)?  $default,){
final _that = this;
switch (_that) {
case _Option() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  T value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Option() when $default != null:
return $default(_that.label,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  T value)  $default,) {final _that = this;
switch (_that) {
case _Option():
return $default(_that.label,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  T value)?  $default,) {final _that = this;
switch (_that) {
case _Option() when $default != null:
return $default(_that.label,_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _Option<T> implements Option<T> {
  const _Option({required this.label, required this.value});
  

@override final  String label;
@override final  T value;

/// Create a copy of Option
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OptionCopyWith<T, _Option<T>> get copyWith => __$OptionCopyWithImpl<T, _Option<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Option<T>&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,label,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'Option<$T>(label: $label, value: $value)';
}


}

/// @nodoc
abstract mixin class _$OptionCopyWith<T,$Res> implements $OptionCopyWith<T, $Res> {
  factory _$OptionCopyWith(_Option<T> value, $Res Function(_Option<T>) _then) = __$OptionCopyWithImpl;
@override @useResult
$Res call({
 String label, T value
});




}
/// @nodoc
class __$OptionCopyWithImpl<T,$Res>
    implements _$OptionCopyWith<T, $Res> {
  __$OptionCopyWithImpl(this._self, this._then);

  final _Option<T> _self;
  final $Res Function(_Option<T>) _then;

/// Create a copy of Option
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? value = freezed,}) {
  return _then(_Option<T>(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

// dart format on
