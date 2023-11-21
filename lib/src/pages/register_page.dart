import 'package:flutter/material.dart';
import 'package:painteres_clone/src/pages/sign_in_page.dart';

import '../common/constants/app_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(height: 50),
          Center(
            child: Image.asset(
              "assets/icons/logo.png",
              height: 170,
            ),
          ),
          const Spacer(),
          Padding(
              padding: EdgeInsets.all(12),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  // boxShadow: const [
                  //   BoxShadow(color: Colors.grey, blurRadius: 10,offset: Offset(4, 5)),
                  // ]
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext) => SignIn()));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(400, 50),
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(
                    "SignIn",
                    style: TextStyle(color: AppColors.black),
                  ),
                ),
              )),
          TextButton(
            onPressed: () {},
            child: Text(
              "SignUp",
              style: TextStyle(
                color: AppColors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: 25)
        ],
      ),
    );
  }
}
