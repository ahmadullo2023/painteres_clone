import 'package:flutter/material.dart';
import 'package:painteres_clone/src/common/constants/app_colors.dart';
import 'package:painteres_clone/src/pages/home_page.dart';
import 'package:painteres_clone/src/view/outline_button.dart';
import 'package:share_plus/share_plus.dart';
import '../model/pinterest_model.dart';
import '../service/network_service.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.images}) : super(key: key);
  final String images;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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

  bool favoriteColor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bc,
      body: pinterestList == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: ListView.builder(
                itemCount: pinterestList!.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      index == 0
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: GestureDetector(
                                    onDoubleTap: () {
                                      setState(() {
                                        favoriteColor = !favoriteColor;
                                      });
                                    },
                                    child: Container(
                                      height: 500,
                                      width: 600,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage(widget.images),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: IconButton(
                                              onPressed: () {
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const HomePage(),
                                                    ),
                                                    (route) => false);
                                              },
                                              icon: const Icon(
                                                Icons.arrow_back_ios_new,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ),
                                            trailing: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  favoriteColor =
                                                      !favoriteColor;
                                                });
                                              },
                                              icon: favoriteColor
                                                  ? const Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.white,
                                                      size: 30,
                                                    )
                                                  : const Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                      size: 30,
                                                    ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 10),
                                  child: Text(
                                    pinterestList![index].user.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, top: 10, right: 10),
                                  child: Text(
                                    pinterestList![index].description,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                 Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const CustomOutlineButton(
                                      text: "Download",
                                    ),
                                    CustomOutlineButton(
                                      onPressed: () async {
                                        await Share.share('check out my website https://example.com', subject: 'Look what I made!');
                                      },
                                      text: "Shared",
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Divider(
                                  thickness: 1,
                                  color: Colors.white,
                                ),
                              ],
                            )
                          : const SizedBox(),
                      const SizedBox(height: 15),
                      pinterestList!.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : SizedBox(
                              height: 600,
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: pinterestList!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPage(
                                            images:
                                                pinterestList![index].urls.raw,
                                          ),
                                        ),
                                      );
                                    },
                                    child: SizedBox(
                                      height: 150,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              pinterestList![index].urls.raw,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                    ],
                  );
                },
              ),
            ),
    );
  }
}
