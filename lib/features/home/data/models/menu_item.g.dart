// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'menu_item.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MenuItemModelCWProxy {
  MenuItemModel id(String id);

  MenuItemModel name(String name);

  MenuItemModel category(String category);

  MenuItemModel imageUrl60(String imageUrl60);

  MenuItemModel imageUrl176(String imageUrl176);

  MenuItemModel imageUrl600(String imageUrl600);

  MenuItemModel price(int price);

  MenuItemModel description(String description);

  MenuItemModel isPopular(bool isPopular);

  MenuItemModel isSoldOut(bool isSoldOut);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MenuItemModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MenuItemModel(...).copyWith(id: 12, name: "My name")
  /// ````
  MenuItemModel call({
    String? id,
    String? name,
    String? category,
    String? imageUrl60,
    String? imageUrl176,
    String? imageUrl600,
    int? price,
    String? description,
    bool? isPopular,
    bool? isSoldOut,
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
  MenuItemModel category(String category) => this(category: category);

  @override
  MenuItemModel imageUrl60(String imageUrl60) => this(imageUrl60: imageUrl60);

  @override
  MenuItemModel imageUrl176(String imageUrl176) =>
      this(imageUrl176: imageUrl176);

  @override
  MenuItemModel imageUrl600(String imageUrl600) =>
      this(imageUrl600: imageUrl600);

  @override
  MenuItemModel price(int price) => this(price: price);

  @override
  MenuItemModel description(String description) =>
      this(description: description);

  @override
  MenuItemModel isPopular(bool isPopular) => this(isPopular: isPopular);

  @override
  MenuItemModel isSoldOut(bool isSoldOut) => this(isSoldOut: isSoldOut);

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
    Object? category = const $CopyWithPlaceholder(),
    Object? imageUrl60 = const $CopyWithPlaceholder(),
    Object? imageUrl176 = const $CopyWithPlaceholder(),
    Object? imageUrl600 = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? isPopular = const $CopyWithPlaceholder(),
    Object? isSoldOut = const $CopyWithPlaceholder(),
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
      category: category == const $CopyWithPlaceholder() || category == null
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as String,
      imageUrl60:
          imageUrl60 == const $CopyWithPlaceholder() || imageUrl60 == null
              ? _value.imageUrl60
              // ignore: cast_nullable_to_non_nullable
              : imageUrl60 as String,
      imageUrl176:
          imageUrl176 == const $CopyWithPlaceholder() || imageUrl176 == null
              ? _value.imageUrl176
              // ignore: cast_nullable_to_non_nullable
              : imageUrl176 as String,
      imageUrl600:
          imageUrl600 == const $CopyWithPlaceholder() || imageUrl600 == null
              ? _value.imageUrl600
              // ignore: cast_nullable_to_non_nullable
              : imageUrl600 as String,
      price: price == const $CopyWithPlaceholder() || price == null
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as int,
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      isPopular: isPopular == const $CopyWithPlaceholder() || isPopular == null
          ? _value.isPopular
          // ignore: cast_nullable_to_non_nullable
          : isPopular as bool,
      isSoldOut: isSoldOut == const $CopyWithPlaceholder() || isSoldOut == null
          ? _value.isSoldOut
          // ignore: cast_nullable_to_non_nullable
          : isSoldOut as bool,
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
      category: json['category'] as String,
      imageUrl60: json['image_url60'] as String? ?? '',
      imageUrl176: json['image_url176'] as String? ?? '',
      imageUrl600: json['image_url600'] as String? ?? '',
      price: json['price'] as int,
      description: json['description'] as String? ?? '',
      isPopular: json['is_popular'] as bool? ?? false,
      isSoldOut: json['is_sold_out'] as bool? ?? false,
    );

const _$MenuItemModelFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'category': 'category',
  'imageUrl60': 'image_url60',
  'imageUrl176': 'image_url176',
  'imageUrl600': 'image_url600',
  'price': 'price',
  'description': 'description',
  'isPopular': 'is_popular',
  'isSoldOut': 'is_sold_out',
};

// ignore: unused_element
abstract class _$MenuItemModelPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? category(String instance) => instance;
  // ignore: unused_element
  static Object? imageUrl60(String instance) => instance;
  // ignore: unused_element
  static Object? imageUrl176(String instance) => instance;
  // ignore: unused_element
  static Object? imageUrl600(String instance) => instance;
  // ignore: unused_element
  static Object? price(int instance) => instance;
  // ignore: unused_element
  static Object? description(String instance) => instance;
  // ignore: unused_element
  static Object? isPopular(bool instance) => instance;
  // ignore: unused_element
  static Object? isSoldOut(bool instance) => instance;
}

Map<String, dynamic> _$MenuItemModelToJson(MenuItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'image_url60': instance.imageUrl60,
      'image_url176': instance.imageUrl176,
      'image_url600': instance.imageUrl600,
      'price': instance.price,
      'description': instance.description,
      'is_popular': instance.isPopular,
      'is_sold_out': instance.isSoldOut,
    };
