import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/constants/animations/shake_transition.dart';
import 'package:flutter_test_app/constants/dimensions.dart';
import 'package:flutter_test_app/constants/theme/style.dart';
import 'package:flutter_test_app/data/models/body/item.dart';

class DetailScreenArgs {
  final ItemModel selectedItem;

  DetailScreenArgs({required this.selectedItem});
}

class DetailScreen extends StatefulWidget {
  final ItemModel selectedItem;

  const DetailScreen({Key? key, required this.selectedItem}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          "Item ${widget.selectedItem.id} from Album ${widget.selectedItem.albumId}",
          style: prodMedium.copyWith(fontSize: Dimensions.fontSizeExtraLarge),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.selectedItem.id,
              transitionOnUserGestures: true,
              child: Container(
                height: size.height / 3,
                width: size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            widget.selectedItem.thumbnailUrl),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ShakeTransition(
                    child: ClipOval(
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  widget.selectedItem.url),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 6,
                  child: ShakeTransition(
                    left: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Title :",
                          style: prodBold,
                        ),
                        Text(
                          widget.selectedItem.title,
                          style: prodRegular,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
