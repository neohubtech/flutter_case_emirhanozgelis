// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupModel _$GroupModelFromJson(Map<String, dynamic> json) => GroupModel(
      bannerList: (json['bannerList'] as List<dynamic>)
          .map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      combinedList: (json['combinedList'] as List<dynamic>)
          .map((e) => CombinedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupModelToJson(GroupModel instance) =>
    <String, dynamic>{
      'bannerList': instance.bannerList.map((e) => e.toJson()).toList(),
      'combinedList': instance.combinedList.map((e) => e.toJson()).toList(),
    };
