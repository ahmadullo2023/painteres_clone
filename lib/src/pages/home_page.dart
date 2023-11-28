import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:painteres_clone/src/cubit/home_cubit/home_state.dart';
import 'package:painteres_clone/src/pages/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<HomeCubit, HomeCubitState>(
          listener: (context, state) => {},
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeErrorState) {
              return const Center(
                child: Text("error state is home page"),
              );
            } else if (state is HomeSuccessState) {
              return GridView.builder(
                itemCount: state.modelList.length,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              images: state.modelList[index].urls.raw,
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 150,
                        child: Image(
                          image: NetworkImage(state.modelList[index].urls.raw),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text("unknown error"),
              );
            }
          },
        ),
      ),
    );
  }
}
