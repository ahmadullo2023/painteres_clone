
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:painteres_clone/src/service/auth_service.dart';

import '../view/custom_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  final streamFirebaseDatabase = FirebaseFirestore.instance.collection("users");
  final firebaseAuth = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: streamFirebaseDatabase.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("error snapshots error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
              child: Column(
                children: [
                  const CircleAvatar(radius: 50),
                  const SizedBox(height: 10),
                  Text(
                    firebaseAuth!.email.toString(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black45,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: 20),
                  ProfileItem(
                    titleT: const Text("Theme"),
                    trailingI: ValueListenableBuilder(
                      valueListenable: Hive.box("openBox").listenable(),
                      builder: (context, box, child) {
                        final getBox = box.get("is_dark", defaultValue: false);
                        return Switch(
                          value: getBox,
                          onChanged: (value) {
                            box.put("is_dark", value);
                          },
                        );
                      },
                    ),
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
                    onPressed: () {
                      AuthService().logOutButton();
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Text("errors");
        }
      },
    ));
  }
}
