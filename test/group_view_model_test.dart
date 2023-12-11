import 'package:flutter_test/flutter_test.dart';
import 'package:intertech/view/group/model/combined_model/combined_model.dart';
import 'package:intertech/view/group/model/group_model/group_model.dart';
import 'package:intertech/view/group/service/interview_services.dart';
import 'package:intertech/view/group/viewmodel/group_view_model.dart';

void main() {
  group('GroupViewModel Test', () {
    late GroupViewModel viewModel;

    setUp(() {
      viewModel = GroupViewModel();
    });

    test('fetchData() should update groupData and isLoading correctly',
        () async {
      await viewModel.fetchData();
      expect(viewModel.groupData.bannerList, isNotEmpty);
      expect(viewModel.groupData.combinedList, isNotEmpty);
      expect(viewModel.isLoading, false);

      await viewModel.fetchData(); // Simulate fetching data

      // Assert
      // Check if groupData is updated after fetching
      expect(viewModel.groupData,
          isNot(GroupModel(bannerList: [], combinedList: [])));
      // Ensure isLoading remains false after completion (mocked fetching)
      expect(viewModel.isLoading,
          false); // Since the fetching process is mocked, isLoading remains false after completion.
    });

    test('toggleSelectedItem() should add or remove items correctly', () {
      // Arrange
      final item1 = CombinedModel(
          type: "type",
          name: 'Item 1',
          imageUrl: 'url1',
          explanation: 'Explanation 1');
      final item2 = CombinedModel(
          type: "type",
          name: 'Item 2',
          imageUrl: 'url2',
          explanation: 'Explanation 2');

      // Act & Assert
      // Ensure selectedItems list is initially empty
      expect(viewModel.selectedItems, isEmpty);

      // Add item1 and check if it's included in selectedItems
      viewModel.toggleSelectedItem(item1);
      expect(viewModel.selectedItems, contains(item1));

      // Add item2 and check if it's included in selectedItems
      viewModel.toggleSelectedItem(item2);
      expect(viewModel.selectedItems, contains(item2));

      // Remove item1 and check if it's removed from selectedItems
      viewModel.toggleSelectedItem(item1);
      expect(viewModel.selectedItems, isNot(contains(item1)));
    });
  });
}
