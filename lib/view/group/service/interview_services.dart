import 'dart:convert';
import 'package:intertech/constants/api_urls.dart';
import 'package:intertech/core/services/http_base_services.dart';
import 'package:intertech/view/group/model/group_model/group_model.dart';

class InterviewServices {
  static InterviewServices shared = InterviewServices._();

  InterviewServices._();

  final HttpBaseServices baseServices = HttpBaseServices();

  Future<GroupModel> fetchGroups() async {
    final response =
        await baseServices.getRequest(url: ApiUrls.shared.interviewUrl);
    if (response.statusCode == 200) {
      Map<String, dynamic> values = json.decode(response.data);
      GroupModel groupList = GroupModel.fromJson(values);
      return groupList;
    } else {
      throw Exception('Failed to fetch groups');
    }
  }
}
