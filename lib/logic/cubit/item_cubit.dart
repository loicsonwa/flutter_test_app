import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/data/models/body/item.dart';
import 'package:flutter_test_app/data/repository/item_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_state.dart';

part 'item_cubit.freezed.dart';

class ItemCubit extends Cubit<ItemState> {
  final ItemRepository itemRepo;

  ItemCubit({required this.itemRepo}) : super(ItemState.initial());

/*Fetch items from api*/
  Future<void> getItemList(int offset, bool reload) async {
    List<ItemModel> itemList = [];
    int? pageSize;

    if (offset == 1 || reload) {
      if (reload) {
        emit(state.copyWith(
            offset: 1, offsetList: [], itemList: null));
      }
    }
    if (!state.offsetList!.contains(offset)) {
      state.offsetList!.add(offset);
      Response response = await itemRepo.getItemList(offset);

      if (response.statusCode == 200) {
        if (offset == 1) {
          itemList = [];
        }

        response.data.forEach((item) => itemList.add(ItemModel.fromJson(item)));
        state.itemList?.addAll(itemList);
        pageSize = 5000;

        emit(state.copyWith(
            itemList: state.itemList ?? itemList,
            pageSize: pageSize,
            isLoading: false,));
      } else {}
    } else {
      if (state.isLoading!) {
        emit(state.copyWith(isLoading: false));
      }
    }
  }

  void sortItemList() {
    List<ItemModel> sortItemList = [];
    sortItemList.addAll(state.itemList!);

      if(state.sortIndex == 0) {
        sortItemList.sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
      }else {
        sortItemList.sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
        Iterable iterable = sortItemList.reversed;
        sortItemList = iterable.toList() as List<ItemModel>;
      }
    for(ItemModel item in sortItemList){
      debugPrint('Sorted list: ${item.id}');
    }
    emit(state.copyWith(itemList: sortItemList));
  }

  void setSortIndex(int index) {
    emit(state.copyWith(sortIndex: index));
  }

  void showBottomLoader() {
    emit(state.copyWith(isLoading: true));
  }

  void setOffset(int offset) {
    emit(state.copyWith(offset: offset));
  }
}
