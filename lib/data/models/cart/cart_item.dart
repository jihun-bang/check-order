import 'package:check_order/data/models/menu/menu_item.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class CartItemModel {
  final String id;
  final MenuItemModel item;
  final int count;
  final DateTime updatedAt;

  CartItemModel({
    required this.id,
    required this.item,
    this.count = 1,
    required this.updatedAt,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}
