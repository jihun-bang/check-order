import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee_call_item.g.dart';

@CopyWith()
@JsonSerializable()
class EmployeeCallItemModel {
  final String id;
  final String name;
  final int count;
  final DateTime updatedAt;

  EmployeeCallItemModel({
    required this.id,
    required this.name,
    this.count = 1,
    required this.updatedAt,
  });

  factory EmployeeCallItemModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeCallItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeCallItemModelToJson(this);
}
