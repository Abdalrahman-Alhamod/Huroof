import 'package:freezed_annotation/freezed_annotation.dart';

part 'option.freezed.dart';

@freezed
abstract class Option<T> with _$Option<T> {
  const factory Option({required String label, required T value}) = _Option<T>;
}
