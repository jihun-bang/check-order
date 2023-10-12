// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MenuItemModelCWProxy {
  MenuItemModel id(String id);

  MenuItemModel name(String name);

  MenuItemModel imageUrl(String imageUrl);

  MenuItemModel price(int price);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MenuItemModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MenuItemModel(...).copyWith(id: 12, name: "My name")
  /// ````
  MenuItemModel call({
    String? id,
    String? name,
    String? imageUrl,
    int? price,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMenuItemModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMenuItemModel.copyWith.fieldName(...)`
class _$MenuItemModelCWProxyImpl implements _$MenuItemModelCWProxy {
  const _$MenuItemModelCWProxyImpl(this._value);

  final MenuItemModel _value;

  @override
  MenuItemModel id(String id) => this(id: id);

  @override
  MenuItemModel name(String name) => this(name: name);

  @override
  MenuItemModel imageUrl(String imageUrl) => this(imageUrl: imageUrl);

  @override
  MenuItemModel price(int price) => this(price: price);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MenuItemModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MenuItemModel(...).copyWith(id: 12, name: "My name")
  /// ````
  MenuItemModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? imageUrl = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
  }) {
    return MenuItemModel(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      imageUrl: imageUrl == const $CopyWithPlaceholder() || imageUrl == null
          ? _value.imageUrl
          // ignore: cast_nullable_to_non_nullable
          : imageUrl as String,
      price: price == const $CopyWithPlaceholder() || price == null
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as int,
    );
  }
}

extension $MenuItemModelCopyWith on MenuItemModel {
  /// Returns a callable class that can be used as follows: `instanceOfMenuItemModel.copyWith(...)` or like so:`instanceOfMenuItemModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MenuItemModelCWProxy get copyWith => _$MenuItemModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItemModel _$MenuItemModelFromJson(Map<String, dynamic> json) =>
    MenuItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      price: json['price'] as int,
    );

Map<String, dynamic> _$MenuItemModelToJson(MenuItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
    };
