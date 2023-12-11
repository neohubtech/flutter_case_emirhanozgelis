
import 'package:json_annotation/json_annotation.dart';

part 'combined_model.g.dart';

@JsonSerializable()

class CombinedModel {
  final String imageUrl;
  final String type;
  final String name;
  final String explanation;

    CombinedModel({
        required this.imageUrl,
        required this.type,
        required this.name,
        required this.explanation,
    });

  factory CombinedModel.fromJson(Map<String, dynamic> json) => _$CombinedModelFromJson(json);

  Map<String, dynamic> toJson() => _$CombinedModelToJson(this);
}
