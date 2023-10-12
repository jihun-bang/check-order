// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CartItemModelCWProxy {
  CartItemModel id(String id);

  CartItemModel item(MenuItemModel item);

  CartItemModel count(int count);

  CartItemModel updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CartItemModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CartItemModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CartItemModel call({
    String? id,
    MenuItemModel? item,
    int? count,
    DateTime? updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCartItemModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCartItemModel.copyWith.fieldName(...)`
class _$CartItemModelCWProxyImpl implements _$CartItemModelCWProxy {
  const _$CartItemModelCWProxyImpl(this._value);

  final CartItemModel _value;

  @override
  CartItemModel id(String id) => this(id: id);

  @override
  CartItemModel item(MenuItemModel item) => this(item: item);

  @override
  CartItemModel count(int count) => this(count: count);

  @override
  CartItemModel updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CartItemModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CartItemModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CartItemModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? item = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return CartItemModel(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      item: item == const $CopyWithPlaceholder() || item == null
          ? _value.item
          // ignore: cast_nullable_to_non_nullable
          : item as MenuItemModel,
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

extension $CartItemModelCopyWith on CartItemModel {
  /// Returns a callable class that can be used as follows: `instanceOfCartItemModel.copyWith(...)` or like so:`instanceOfCartItemModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CartItemModelCWProxy get copyWith => _$CartItemModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      id: json['id'] as String,
      item: MenuItemModel.fromJson(json['item'] as Map<String, dynamic>),
      count: json['count'] as int? ?? 1,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item.toJson(),
      'count': instance.count,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
