import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/constants/dimensions.dart';
import 'package:flutter_test_app/constants/router/routes.dart';
import 'package:flutter_test_app/constants/theme/color.dart';
import 'package:flutter_test_app/constants/theme/style.dart';
import 'package:flutter_test_app/logic/cubit/item_cubit.dart';
import 'package:flutter_test_app/views/screens/details/detail_screen.dart';
import 'package:flutter_test_app/views/widgets/item_shimmer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    initialisation();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemCubit = BlocProvider.of<ItemCubit>(context);

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Home",
          style: prodMedium.copyWith(fontSize: Dimensions.fontSizeOverLarge),
        ),
        actions: [
          BlocBuilder<ItemCubit, ItemState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  itemCubit.sortItemList();
                  if (itemCubit.state.sortIndex == 0) {
                    itemCubit.setSortIndex(-1);
                  } else {
                    itemCubit.setSortIndex(0);
                  }
                },
                icon: Icon(state.sortIndex == 0
                    ? MdiIcons.sortAlphabeticalDescending
                    : MdiIcons.sortAlphabeticalAscending),
              );
            },
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => onRefresh(),
        child: BlocBuilder<ItemCubit, ItemState>(
          builder: (context, state) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              child: Column(
                children: [
                  state.itemList != null
                      ? state.itemList!.isNotEmpty
                          ? GridView.builder(
                              key: UniqueKey(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: Dimensions.PADDING_SIZE_LARGE,
                                mainAxisSpacing: 0.01,
                                childAspectRatio: .8,
                                crossAxisCount: 2,
                              ),
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              padding: const EdgeInsets.symmetric(
                                horizontal: Dimensions.PADDING_SIZE_SMALL,
                                vertical: 0,
                              ),
                              itemCount: state.itemList!.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(
                                    bottom:
                                        Dimensions.PADDING_SIZE_EXTRA_LARGE),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.DETAIL_PAGE,
                                      arguments: DetailScreenArgs(
                                        selectedItem: state.itemList![index],
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              child: Hero(
                                                tag: state.itemList![index].id,
                                                transitionOnUserGestures: true,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                        image:
                                                            CachedNetworkImageProvider(
                                                                state
                                                                    .itemList![
                                                                        index]
                                                                    .url),
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                              ),
                                            ),
                                            const Positioned(
                                              right: 16,
                                              bottom: 16,
                                              child: Icon(
                                                Icons.arrow_forward_outlined,
                                                color: white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        state.itemList![index].title,
                                        style: prodMedium,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Expanded(
                              child: Center(
                                child: Text(
                                  'No item found, sorry !',
                                  style: prodMedium.copyWith(
                                      fontSize: Dimensions.fontSizeExtraLarge),
                                ),
                              ),
                            )
                      : ItemShimmer(isEnabled: state.itemList == null),
                  state.isLoading!
                      ? ItemShimmer(isEnabled: state.itemList == null)
                      : const SizedBox(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  initialisation() async {
    final itemCubit = BlocProvider.of<ItemCubit>(context);
    itemCubit.getItemList(1, false);
    itemCubit.setOffset(1);
    int offset = 1;

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          itemCubit.state.itemList != null &&
          !itemCubit.state.isLoading!) {
        int pageSize = (itemCubit.state.pageSize! / 10).ceil();
        if (itemCubit.state.offset! < pageSize) {
          offset += offset;
          itemCubit.setOffset(itemCubit.state.offset! + 1);
          print('end of the page');
          itemCubit.showBottomLoader();
          itemCubit.getItemList(itemCubit.state.offset!, false);
        }
      }
    });
  }

  Future<void> onRefresh() async {
    BlocProvider.of<ItemCubit>(context).getItemList(1, true);
  }
}
