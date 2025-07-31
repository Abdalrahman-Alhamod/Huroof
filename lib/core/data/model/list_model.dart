import 'package:flutter/foundation.dart';

class ListModel<T> {
  final List<T> items;

  const ListModel({required this.items});

  factory ListModel.fromJson(
    List<dynamic> jsonList,
    T Function(dynamic json) fromJsonT,
  ) {
    return ListModel(items: jsonList.map((e) => fromJsonT(e)).toList());
  }

  List<dynamic> toJson(Object? Function(T value) toJsonT) {
    return items.map((e) => toJsonT(e)).toList();
  }

  @override
  String toString() => 'ListModel<$T>(items: $items)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ListModel<T> && listEquals(other.items, items));
  }

  @override
  int get hashCode => Object.hashAll(items);
}
