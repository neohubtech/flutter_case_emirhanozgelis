// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combined_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CombinedModel _$CombinedModelFromJson(Map<String, dynamic> json) =>
    CombinedModel(
      imageUrl: json['imageUrl'] as String,
      type: json['type'] as String,
      name: json['name'] as String,
      explanation: json['explanation'] as String,
    );

Map<String, dynamic> _$CombinedModelToJson(CombinedModel instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'type': instance.type,
      'name': instance.name,
      'explanation': instance.explanation,
    };
