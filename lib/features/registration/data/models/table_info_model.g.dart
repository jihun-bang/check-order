// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'table_info_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TableInfoModelCWProxy {
  TableInfoModel ipAddress(String ipAddress);

  TableInfoModel tableName(String tableName);

  TableInfoModel description(String description);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TableInfoModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TableInfoModel(...).copyWith(id: 12, name: "My name")
  /// ````
  TableInfoModel call({
    String? ipAddress,
    String? tableName,
    String? description,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTableInfoModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTableInfoModel.copyWith.fieldName(...)`
class _$TableInfoModelCWProxyImpl implements _$TableInfoModelCWProxy {
  const _$TableInfoModelCWProxyImpl(this._value);

  final TableInfoModel _value;

  @override
  TableInfoModel ipAddress(String ipAddress) => this(ipAddress: ipAddress);

  @override
  TableInfoModel tableName(String tableName) => this(tableName: tableName);

  @override
  TableInfoModel description(String description) =>
      this(description: description);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TableInfoModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TableInfoModel(...).copyWith(id: 12, name: "My name")
  /// ````
  TableInfoModel call({
    Object? ipAddress = const $CopyWithPlaceholder(),
    Object? tableName = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
  }) {
    return TableInfoModel(
      ipAddress: ipAddress == const $CopyWithPlaceholder() || ipAddress == null
          ? _value.ipAddress
          // ignore: cast_nullable_to_non_nullable
          : ipAddress as String,
      tableName: tableName == const $CopyWithPlaceholder() || tableName == null
          ? _value.tableName
          // ignore: cast_nullable_to_non_nullable
          : tableName as String,
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
    );
  }
}

extension $TableInfoModelCopyWith on TableInfoModel {
  /// Returns a callable class that can be used as follows: `instanceOfTableInfoModel.copyWith(...)` or like so:`instanceOfTableInfoModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TableInfoModelCWProxy get copyWith => _$TableInfoModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TableInfoModel _$TableInfoModelFromJson(Map<String, dynamic> json) =>
    TableInfoModel(
      ipAddress: json['ip_address'] as String? ?? '',
      tableName: json['table_name'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

const _$TableInfoModelFieldMap = <String, String>{
  'ipAddress': 'ip_address',
  'tableName': 'table_name',
  'description': 'description',
};

// ignore: unused_element
abstract class _$TableInfoModelPerFieldToJson {
  // ignore: unused_element
  static Object? ipAddress(String instance) => instance;
  // ignore: unused_element
  static Object? tableName(String instance) => instance;
  // ignore: unused_element
  static Object? description(String instance) => instance;
}

Map<String, dynamic> _$TableInfoModelToJson(TableInfoModel instance) =>
    <String, dynamic>{
      'ip_address': instance.ipAddress,
      'table_name': instance.tableName,
      'description': instance.description,
    };
