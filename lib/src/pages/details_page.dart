import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:painteres_clone/src/common/constants/app_colors.dart';
import 'package:painteres_clone/src/cubit/details_cubit/details_state.dart';
import 'package:painteres_clone/src/pages/home_page.dart';
import 'package:painteres_clone/src/view/outline_button.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.images});
  final String images;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool favoriteColor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bc,
      body: SafeArea(
        child: BlocConsumer<DetailsCubit, DetailsCubitState>(
          listener: (context, state) => {},
          builder: (context, state) {
            if (state is DetailsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is DetailsErrorState) {
              return const Center(
                child: Text("errors state details page"),
              );
            } else if (state is DetailsSuccessState) {
              return ListView.builder(
                itemCount: state.pinterestList.length,
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
                                      setState(
                                        () {
                                          favoriteColor = !favoriteColor;
                                        },
                                      );
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
                                    state.pinterestList[index].user.name,
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
                                    state.pinterestList[index].description,
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
                                      onPressed: () async {},
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
                      SizedBox(
                        height: 600,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.pinterestList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                      images:
                                          state.pinterestList[index].urls.raw,
                                    ),
                                  ),
                                  (route) => false,
                                );
                              },
                              child: SizedBox(
                                height: 150,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        state.pinterestList[index].urls.thumb,
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
              );
            } else {
              return const Center(
                child: Text("error unknown details state"),
              );
            }
          },
        ),
      ),
    );
  }
}
