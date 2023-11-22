import 'package:flutter/material.dart';
import 'package:painteres_clone/src/common/constants/app_colors.dart';
import 'package:painteres_clone/src/common/validation/validation.dart';
import 'package:painteres_clone/src/pages/page_builder.dart';

import '../service/auth_service.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey1 = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey1,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.elliptical(200, 50),
                  bottomLeft: Radius.elliptical(200, 50),
                ),
              ),
              child: Center(
                child: Image.asset(
                  "assets/icons/logo.png",
                  height: 100,
                ),
              ),
            ),
            const SizedBox(height: 100),
            const Center(
              child: Text(
                "Sign In Now",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: email,
                validator: (value) => Validation().emailIn(value),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.black,
                  ),
                  hintText: "Your Email",
                  filled: true,
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: password,
                validator: (value) => Validation().passwordIn(value),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: AppColors.black,
                  ),
                  suffixIcon: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: AppColors.black,
                  ),
                  hintText: "Your Password",
                  filled: true,
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
                padding: const EdgeInsets.all(12),
                child: DecoratedBox(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey1.currentState!.validate()) {
                        AuthService().signIn(email.text, password.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PageBuilder(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(400, 50),
                      backgroundColor: AppColors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: const Text(
                      "SignIn",
                    ),
                  ),
                )),
            TextButton(
              onPressed: widget.onTap,
              child: const Text(
                "SignUp",
                style: TextStyle(
                  color: AppColors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 18)
          ],
        ),
      ),
    );
  }
}
