import 'package:flutter/material.dart';
import 'package:intertech/view/group/model/combined_model/combined_model.dart';
import 'package:intertech/view/group/model/group_model/group_model.dart';
import 'package:intertech/view/group/service/interview_services.dart';
import 'package:mobx/mobx.dart';

part 'group_view_model.g.dart';

class GroupViewModel = _GroupViewModelBase with _$GroupViewModel;

abstract class _GroupViewModelBase with Store {
  // Observable variables to track group data, selected items, and loading state
  @observable
  GroupModel groupData = GroupModel(bannerList: [], combinedList: []);

  @observable
  ObservableList<CombinedModel> selectedItems = ObservableList<CombinedModel>();

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchData() async {
    try {
      isLoading = true;
      // Fetching group data using InterviewServices
      groupData = await InterviewServices.shared.fetchGroups();

    } catch (e) {
      debugPrint('Error while fetching data: $e');
    } finally {
      isLoading = false;
    }
  }

  // Action to toggle the selection of an item
  @action
  void toggleSelectedItem(CombinedModel item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
  }
}
