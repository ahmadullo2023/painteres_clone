import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "FAVORITE",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: SizedBox(
                  height: 600,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          "favorite title",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        subtitle: Text(
                          "favorite subtitle",
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        leading: _customCard("assets/images/pinteres_logo.png"),
                        trailing: IconButton(
                          onPressed: () => {},
                          icon: const Icon(Icons.favorite, color: Colors.red),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customCard(String images) {
    return  SizedBox(
      height: 55,
      width: 55,
      child: DecoratedBox(
        decoration: const  BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Center(
          child: Image(
            image: AssetImage(images),
            height: 35,
          ),
        ),
      ),
    );
  }
}
