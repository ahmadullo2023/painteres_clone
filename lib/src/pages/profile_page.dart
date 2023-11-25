import 'package:flutter/material.dart';

import '../common/constants/app_colors.dart';
import '../view/custom_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        leading: const Icon(Icons.logout),
        actions: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.account_circle,
                size: 100,
              ),
            ),
            SizedBox(height: 20),
            ProfileItem(
              titleT: Text("History"),
              trailingI: Icon(Icons.arrow_forward_ios),
            ),
            ProfileItem(
              titleT: Text("Massage"),
              trailingI: Icon(Icons.arrow_forward_ios),
            ),
            ProfileItem(
              titleT: Text("Payments"),
              trailingI: Icon(Icons.arrow_forward_ios),
            ),
            ProfileItem(
              titleT: Text("Looking a job"),
              trailingI: Icon(Icons.arrow_forward_ios),
            ),
            ProfileItem(
              titleT: Text("Other"),
              trailingI: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}

