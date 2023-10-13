// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OrderItemModelCWProxy {
  OrderItemModel id(String id);

  OrderItemModel item(MenuItemModel item);

  OrderItemModel count(int count);

  OrderItemModel updatedAt(DateTime updatedAt);

  OrderItemModel totalAmount(int totalAmount);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderItemModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderItemModel(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderItemModel call({
    String? id,
    MenuItemModel? item,
    int? count,
    DateTime? updatedAt,
    int? totalAmount,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrderItemModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOrderItemModel.copyWith.fieldName(...)`
class _$OrderItemModelCWProxyImpl implements _$OrderItemModelCWProxy {
  const _$OrderItemModelCWProxyImpl(this._value);

  final OrderItemModel _value;

  @override
  OrderItemModel id(String id) => this(id: id);

  @override
  OrderItemModel item(MenuItemModel item) => this(item: item);

  @override
  OrderItemModel count(int count) => this(count: count);

  @override
  OrderItemModel updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  OrderItemModel totalAmount(int totalAmount) => this(totalAmount: totalAmount);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderItemModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderItemModel(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderItemModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? item = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? totalAmount = const $CopyWithPlaceholder(),
  }) {
    return OrderItemModel(
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
      totalAmount:
          totalAmount == const $CopyWithPlaceholder() || totalAmount == null
              ? _value.totalAmount
              // ignore: cast_nullable_to_non_nullable
              : totalAmount as int,
    );
  }
}

extension $OrderItemModelCopyWith on OrderItemModel {
  /// Returns a callable class that can be used as follows: `instanceOfOrderItemModel.copyWith(...)` or like so:`instanceOfOrderItemModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OrderItemModelCWProxy get copyWith => _$OrderItemModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    OrderItemModel(
      id: json['id'] as String,
      item: MenuItemModel.fromJson(json['item'] as Map<String, dynamic>),
      count: json['count'] as int? ?? 1,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      totalAmount: json['totalAmount'] as int,
    );

Map<String, dynamic> _$OrderItemModelToJson(OrderItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item.toJson(),
      'count': instance.count,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'totalAmount': instance.totalAmount,
    };
