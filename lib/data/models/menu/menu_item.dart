import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_item.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class MenuItemModel {
  final String id;
  final String name;
  final String category;
  final String imageUrl60;
  final String imageUrl176;
  final String imageUrl600;
  final int price;
  final String description;
  final bool isPopular;
  final bool isSoldOut;

  MenuItemModel({
    required this.id,
    required this.name,
    required this.category,
    this.imageUrl60 = '',
    this.imageUrl176 = '',
    this.imageUrl600 = '',
    required this.price,
    this.description = '',
    this.isPopular = false,
    this.isSoldOut = false,
  });

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemModelToJson(this);
}
