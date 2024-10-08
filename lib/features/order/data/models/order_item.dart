import 'package:check_order/features/home/data/models/menu_item.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_item.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class OrderItemModel {
  final String id;
  final MenuItemModel item;
  final int count;
  final DateTime updatedAt;
  final int totalAmount;

  OrderItemModel({
    required this.id,
    required this.item,
    this.count = 1,
    required this.updatedAt,
    required this.totalAmount,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemModelToJson(this);
}
