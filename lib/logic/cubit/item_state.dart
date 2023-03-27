part of 'item_cubit.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ItemState with _$ItemState {
  factory ItemState({
    bool? isLoading,
    List<ItemModel>? itemList,
    required List<ItemModel> sortItemList,
    List<int>? offsetList,
    int? offset,
    int? pageSize,
    int? sortIndex,
  }) = _ItemState;

  factory ItemState.initial() => ItemState(
    isLoading: false,
    itemList: null,
    sortItemList: [],
    offsetList: [],
    offset: 1,
    sortIndex: -1,
  );
}
