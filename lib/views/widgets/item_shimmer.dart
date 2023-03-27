import 'package:flutter/material.dart';
import 'package:flutter_test_app/constants/dimensions.dart';
import 'package:shimmer/shimmer.dart';

class ItemShimmer extends StatelessWidget {
  final bool isEnabled;

  const ItemShimmer({super.key, required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: Dimensions.PADDING_SIZE_LARGE,
        mainAxisSpacing: 0.01,
        childAspectRatio: 1,
        crossAxisCount: 2,
      ),
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          period: const Duration(seconds: 2),
          enabled: isEnabled,
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
            child: Container(
              padding: const EdgeInsets.all(Dimensions.RADIUS_DEFAULT),
              decoration: BoxDecoration(
                border: Border.all(width: .5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Container(
                        height: 20,
                        width: 20,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
