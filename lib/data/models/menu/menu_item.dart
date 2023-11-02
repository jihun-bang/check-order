import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_item.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class MenuItemModel {
  final String id;
  final String name;
  final String category;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  final int price;
  final String description;
  final bool isPopular;
  final bool isSoldOut;

  MenuItemModel({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    this.description = '',
    this.isPopular = false,
    this.isSoldOut = false,
  });

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemModelToJson(this);
}
