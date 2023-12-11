
import 'package:intertech/view/group/model/banner_model/banner_model.dart';
import 'package:intertech/view/group/model/combined_model/combined_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GroupModel {
   final List<BannerModel> bannerList;
   final List<CombinedModel> combinedList;

    GroupModel({
        required this.bannerList,
        required this.combinedList,
    });

  factory GroupModel.fromJson(Map<String, dynamic> json) => _$GroupModelFromJson(json);

  Map<String, dynamic> toJson() => _$GroupModelToJson(this);

}
