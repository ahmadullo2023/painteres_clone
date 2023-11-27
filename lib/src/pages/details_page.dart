import 'package:flutter/material.dart';
import 'package:painteres_clone/src/common/constants/app_colors.dart';
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

  @override
  void initState() {
    getAllImages();
    super.initState();
  }

  Future getAllImages() async {
    List<PinterestModel>? newImages = await HttpService().gelAllImages();
    if (pinterestList == null) {
      pinterestList = newImages;
    } else {
      pinterestList!.addAll(newImages);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bc,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                  height: 500,
                  width: 600,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // image: DecorationImage(
                    //   image: NetworkImage(imagess),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child: const Column(
                    children: [
                      ListTile(
                        leading:
                            Icon(Icons.arrow_back_ios_new, color: Colors.white),
                        trailing:
                            Icon(Icons.favorite_border, color: Colors.white),
                      ),
                    ],
                  )),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text("Dowland"),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text("Shared"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              thickness: 1,
              color: Colors.white,
            ),
            //HomePage(),
            SizedBox(
              height: 600,
              child: GridView.builder(
                itemCount: pinterestList?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Image(
                    image: NetworkImage(pinterestList![index].urls.raw),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}