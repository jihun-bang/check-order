import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_item.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class MenuItemModel {
  final String id;
  final String name;
  final String imageUrl;
  final int price;

  MenuItemModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemModelToJson(this);
}
