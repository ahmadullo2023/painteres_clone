import 'package:flutter/material.dart';
import 'package:painteres_clone/src/pages/details_page.dart';
import 'package:painteres_clone/src/service/network_service.dart';
import 'package:painteres_clone/src/view/shimmer.dart';

import '../model/pinterest_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {


  List<PinterestModel>? pinterestList;
  late final ScrollController scrollController;
  bool isLoaded = false;
  int count = 1;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    super.initState();
    getAllImages();
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (!isLoaded) {
        setState(() {
          isLoaded = true;
        });
        getAllImages();
      }
    }
  }

  Future getAllImages() async {
    List<PinterestModel>? newImages = await HttpService().gelAllImages();
    if (newImages != null) {
      if (pinterestList == null) {
        pinterestList = newImages;
      } else {
        pinterestList!.addAll(newImages);
      }
      setState(() {
        isLoaded = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pinterestList == null ? const CustomShimmer()
          : GridView.builder(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: pinterestList!.length + 1,
              itemBuilder: (context, index) {
                if (index < pinterestList!.length) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            images: pinterestList![index].urls.raw
                          ),
                        ),
                      );
                    },
                    child: Image(
                      image: NetworkImage(pinterestList![index].urls.raw),
                      fit: BoxFit.cover,
                    ),
                  );
                } else {
                  if (isLoaded) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return const SizedBox
                        .shrink(); // If no new data is being loaded, hide the indicator
                  }
                }
              },
            ),
    );
  }
}
