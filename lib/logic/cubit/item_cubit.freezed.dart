// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ItemState {
  bool? get isLoading => throw _privateConstructorUsedError;
  List<ItemModel>? get itemList => throw _privateConstructorUsedError;
  List<ItemModel> get sortItemList => throw _privateConstructorUsedError;
  List<int>? get offsetList => throw _privateConstructorUsedError;
  int? get offset => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;
  int? get sortIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemStateCopyWith<ItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemStateCopyWith<$Res> {
  factory $ItemStateCopyWith(ItemState value, $Res Function(ItemState) then) =
      _$ItemStateCopyWithImpl<$Res, ItemState>;
  @useResult
  $Res call(
      {bool? isLoading,
      List<ItemModel>? itemList,
      List<ItemModel> sortItemList,
      List<int>? offsetList,
      int? offset,
      int? pageSize,
      int? sortIndex});
}

/// @nodoc
class _$ItemStateCopyWithImpl<$Res, $Val extends ItemState>
    implements $ItemStateCopyWith<$Res> {
  _$ItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? itemList = freezed,
    Object? sortItemList = null,
    Object? offsetList = freezed,
    Object? offset = freezed,
    Object? pageSize = freezed,
    Object? sortIndex = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      itemList: freezed == itemList
          ? _value.itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>?,
      sortItemList: null == sortItemList
          ? _value.sortItemList
          : sortItemList // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      offsetList: freezed == offsetList
          ? _value.offsetList
          : offsetList // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      sortIndex: freezed == sortIndex
          ? _value.sortIndex
          : sortIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemStateCopyWith<$Res> implements $ItemStateCopyWith<$Res> {
  factory _$$_ItemStateCopyWith(
          _$_ItemState value, $Res Function(_$_ItemState) then) =
      __$$_ItemStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? isLoading,
      List<ItemModel>? itemList,
      List<ItemModel> sortItemList,
      List<int>? offsetList,
      int? offset,
      int? pageSize,
      int? sortIndex});
}

/// @nodoc
class __$$_ItemStateCopyWithImpl<$Res>
    extends _$ItemStateCopyWithImpl<$Res, _$_ItemState>
    implements _$$_ItemStateCopyWith<$Res> {
  __$$_ItemStateCopyWithImpl(
      _$_ItemState _value, $Res Function(_$_ItemState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? itemList = freezed,
    Object? sortItemList = null,
    Object? offsetList = freezed,
    Object? offset = freezed,
    Object? pageSize = freezed,
    Object? sortIndex = freezed,
  }) {
    return _then(_$_ItemState(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      itemList: freezed == itemList
          ? _value.itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>?,
      sortItemList: null == sortItemList
          ? _value.sortItemList
          : sortItemList // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      offsetList: freezed == offsetList
          ? _value.offsetList
          : offsetList // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      sortIndex: freezed == sortIndex
          ? _value.sortIndex
          : sortIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_ItemState implements _ItemState {
  _$_ItemState(
      {this.isLoading,
      this.itemList,
      required this.sortItemList,
      this.offsetList,
      this.offset,
      this.pageSize,
      this.sortIndex});

  @override
  final bool? isLoading;
  @override
  final List<ItemModel>? itemList;
  @override
  final List<ItemModel> sortItemList;
  @override
  final List<int>? offsetList;
  @override
  final int? offset;
  @override
  final int? pageSize;
  @override
  final int? sortIndex;

  @override
  String toString() {
    return 'ItemState(isLoading: $isLoading, itemList: $itemList, sortItemList: $sortItemList, offsetList: $offsetList, offset: $offset, pageSize: $pageSize, sortIndex: $sortIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other.itemList, itemList) &&
            const DeepCollectionEquality()
                .equals(other.sortItemList, sortItemList) &&
            const DeepCollectionEquality()
                .equals(other.offsetList, offsetList) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.sortIndex, sortIndex) ||
                other.sortIndex == sortIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(itemList),
      const DeepCollectionEquality().hash(sortItemList),
      const DeepCollectionEquality().hash(offsetList),
      offset,
      pageSize,
      sortIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemStateCopyWith<_$_ItemState> get copyWith =>
      __$$_ItemStateCopyWithImpl<_$_ItemState>(this, _$identity);
}

abstract class _ItemState implements ItemState {
  factory _ItemState(
      {final bool? isLoading,
      final List<ItemModel>? itemList,
      required final List<ItemModel> sortItemList,
      final List<int>? offsetList,
      final int? offset,
      final int? pageSize,
      final int? sortIndex}) = _$_ItemState;

  @override
  bool? get isLoading;
  @override
  List<ItemModel>? get itemList;
  @override
  List<ItemModel> get sortItemList;
  @override
  List<int>? get offsetList;
  @override
  int? get offset;
  @override
  int? get pageSize;
  @override
  int? get sortIndex;
  @override
  @JsonKey(ignore: true)
  _$$_ItemStateCopyWith<_$_ItemState> get copyWith =>
      throw _privateConstructorUsedError;
}
