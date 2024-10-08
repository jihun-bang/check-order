import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'table_info_model.g.dart';

@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake)
class TableInfoModel {
  final String tableName;
  final String description;

  TableInfoModel({
    this.tableName = '',
    this.description = '',
  });

  bool get isValid => tableName.trim().isNotEmpty;

  factory TableInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TableInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TableInfoModelToJson(this);
}
