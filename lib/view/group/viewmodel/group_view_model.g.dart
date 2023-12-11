// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GroupViewModel on _GroupViewModelBase, Store {
  late final _$groupDataAtom =
      Atom(name: '_GroupViewModelBase.groupData', context: context);

  @override
  GroupModel get groupData {
    _$groupDataAtom.reportRead();
    return super.groupData;
  }

  @override
  set groupData(GroupModel value) {
    _$groupDataAtom.reportWrite(value, super.groupData, () {
      super.groupData = value;
    });
  }

  late final _$selectedItemsAtom =
      Atom(name: '_GroupViewModelBase.selectedItems', context: context);

  @override
  ObservableList<CombinedModel> get selectedItems {
    _$selectedItemsAtom.reportRead();
    return super.selectedItems;
  }

  @override
  set selectedItems(ObservableList<CombinedModel> value) {
    _$selectedItemsAtom.reportWrite(value, super.selectedItems, () {
      super.selectedItems = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_GroupViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('_GroupViewModelBase.fetchData', context: context);

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  late final _$_GroupViewModelBaseActionController =
      ActionController(name: '_GroupViewModelBase', context: context);

  @override
  void toggleSelectedItem(CombinedModel item) {
    final _$actionInfo = _$_GroupViewModelBaseActionController.startAction(
        name: '_GroupViewModelBase.toggleSelectedItem');
    try {
      return super.toggleSelectedItem(item);
    } finally {
      _$_GroupViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
groupData: ${groupData},
selectedItems: ${selectedItems},
isLoading: ${isLoading}
    ''';
  }
}
