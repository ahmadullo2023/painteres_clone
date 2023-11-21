import 'package:flutter/material.dart';
import 'package:painteres_clone/src/common/constants/app_icons.dart';
import 'package:painteres_clone/src/pages/favorite_page.dart';
import 'package:painteres_clone/src/pages/home_page.dart';
import 'package:painteres_clone/src/pages/profile_page.dart';

import '../common/constants/app_colors.dart';
import '../view/custom_item.dart';

class PageBuilder extends StatefulWidget {
  const PageBuilder({super.key});

  @override
  State<PageBuilder> createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  late final PageController controller;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onTap(int value) {
    controller.animateToPage(
      value,
      duration: const Duration(milliseconds: 150),
      curve: Curves.linear,
    );
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(45),
          ),
          child: BottomAppBar(
            color: Colors.black,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomBottomItem(
                  assetImages: AppIcons.homeIcon,
                  currentPage: 0,
                  index: index,
                  onTap: () {
                    setState(() {
                      onTap(index = 0);
                    });
                  },
                ),
                CustomBottomItem(
                  assetImages: AppIcons.favoriteIcon,
                  currentPage: 1,
                  index: index,
                  onTap: () {
                    setState(() {
                      onTap(index = 1);
                    });
                  },
                ),
                CustomBottomItem(
                  assetImages: AppIcons.profileIcon,
                  index: index,
                  currentPage: 2,
                  onTap: () {
                    setState(() {
                      onTap(index = 2);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          HomePage(),
          FavoritePage(),
          ProfilePage()
        ],
      ),
    );
  }
}