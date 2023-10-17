// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_call_item.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EmployeeCallItemModelCWProxy {
  EmployeeCallItemModel id(String id);

  EmployeeCallItemModel name(String name);

  EmployeeCallItemModel count(int count);

  EmployeeCallItemModel updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EmployeeCallItemModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EmployeeCallItemModel(...).copyWith(id: 12, name: "My name")
  /// ````
  EmployeeCallItemModel call({
    String? id,
    String? name,
    int? count,
    DateTime? updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEmployeeCallItemModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEmployeeCallItemModel.copyWith.fieldName(...)`
class _$EmployeeCallItemModelCWProxyImpl
    implements _$EmployeeCallItemModelCWProxy {
  const _$EmployeeCallItemModelCWProxyImpl(this._value);

  final EmployeeCallItemModel _value;

  @override
  EmployeeCallItemModel id(String id) => this(id: id);

  @override
  EmployeeCallItemModel name(String name) => this(name: name);

  @override
  EmployeeCallItemModel count(int count) => this(count: count);

  @override
  EmployeeCallItemModel updatedAt(DateTime updatedAt) =>
      this(updatedAt: updatedAt);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EmployeeCallItemModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EmployeeCallItemModel(...).copyWith(id: 12, name: "My name")
  /// ````
  EmployeeCallItemModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return EmployeeCallItemModel(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      count: count == const $CopyWithPlaceholder() || count == null
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int,
      updatedAt: updatedAt == const $CopyWithPlaceholder() || updatedAt == null
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
    );
  }
}

extension $EmployeeCallItemModelCopyWith on EmployeeCallItemModel {
  /// Returns a callable class that can be used as follows: `instanceOfEmployeeCallItemModel.copyWith(...)` or like so:`instanceOfEmployeeCallItemModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EmployeeCallItemModelCWProxy get copyWith =>
      _$EmployeeCallItemModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeCallItemModel _$EmployeeCallItemModelFromJson(
        Map<String, dynamic> json) =>
    EmployeeCallItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      count: json['count'] as int? ?? 1,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$EmployeeCallItemModelToJson(
        EmployeeCallItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'count': instance.count,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
