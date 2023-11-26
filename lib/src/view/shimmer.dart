import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 100,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          highlightColor: Colors.grey,
          baseColor: Colors.grey.shade500,
          child: const  SizedBox(
            height: 150,
            width: 150,
            child: ColoredBox(
              color: Colors.green,
            ),
          ),
        );
      },
    );
  }
}
