import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:painteres_clone/src/pages/sign_in_page.dart';

import '../view/custom_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  final streamFirebaseDatabase = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: streamFirebaseDatabase.doc().get(),
        builder: (context, snapshot) {
          Map<String, dynamic> data =
              snapshot.data?.data() as Map<String, dynamic>;
          if (snapshot.hasError) {
            return const Text("Firebase snapshots data error");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("snapshots hasData exists error");
          } else {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
                child: Column(
                  children: [
                    const CircleAvatar(radius: 50),
                    const SizedBox(height: 20),
                    Text(
                      data["username"],
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      data["userEmail"],
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.black45,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 20),
                    const ProfileItem(
                      titleT: Text("History"),
                      trailingI: Icon(Icons.arrow_forward_ios),
                    ),
                    const ProfileItem(
                      titleT: Text("Massage"),
                      trailingI: Icon(Icons.arrow_forward_ios),
                    ),
                    const ProfileItem(
                      titleT: Text("Info"),
                      trailingI: Icon(Icons.arrow_forward_ios),
                    ),
                    const ProfileItem(
                      titleT: Text("Help center"),
                      trailingI: Icon(Icons.arrow_forward_ios),
                    ),
                    ProfileItem(
                      titleT: const Text("Log out"),
                      trailingI: const Icon(Icons.login),
                      onPressed: () => navigationPush(context),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void navigationPush(BuildContext buildContext) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const SignIn(),
        ),
        (route) => false);
  }
}
