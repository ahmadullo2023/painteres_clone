import 'package:flutter/material.dart';
import '../common/constants/app_colors.dart';

class CustomBottomItem extends StatelessWidget {
  const CustomBottomItem({
    super.key,
    required this.assetImages,
    required this.onTap,
    required this.index,
    required this.currentPage,
  });

  final void Function()? onTap;
  final String assetImages;
  final int index;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 45,
            width: 45,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 52, 48, 49),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(assetImages),
                  height: 24,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          index  == currentPage ? Container(
            height: 5,
            width: 5,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
          ): const SizedBox.shrink(),
        ],
      ),
    );
  }
}


class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.titleT,
    required this.trailingI, this.onPressed,
  });

  final Widget trailingI;
  final Widget titleT;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onPressed,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            )
          ),
          title: titleT,
          trailing: trailingI,
        ),
        const SizedBox(height: 10),
        const Divider(color: Colors.black),
      ],
    );
  }
}