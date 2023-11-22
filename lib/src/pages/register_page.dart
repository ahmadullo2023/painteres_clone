import 'package:flutter/material.dart';
import 'package:painteres_clone/src/pages/sign_in_page.dart';
import 'package:painteres_clone/src/pages/sign_up_page.dart';

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
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/icons/logo.png",
              height: 170,
            ),
          ),
          Align(
            alignment: Alignment(0, .8),
            child: Padding(
                padding: EdgeInsets.all(12),
                child: DecoratedBox(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext) => SignIn()));
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(400, 50),
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: const Text(
                      "SignIn",
                      style: TextStyle(color: AppColors.black),
                    ),
                  ),
                )),
          ),
          Align(
            alignment: Alignment(0, .95),
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext) => SignUp()));
              },
              child: const Text(
                "SignUp",
                style: TextStyle(
                  color: AppColors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
