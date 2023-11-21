import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey1 = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
      key: _formKey1,
        child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            child: Center(
              child: Image.asset(
                "assets/icons/logo.png",
                height: 100,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.elliptical(200, 50),
                bottomLeft: Radius.elliptical(200, 50),
              ),
            ),
          ),
          SizedBox(height: 100),
          Center(
            child: Text(
              "Sign In Now",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.all(12),
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
