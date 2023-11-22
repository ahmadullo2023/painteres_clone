import 'package:flutter/material.dart';
import 'package:painteres_clone/src/common/constants/app_colors.dart';
import 'package:painteres_clone/src/common/constants/app_icons.dart';



import '../common/validation/validation.dart';
import '../service/auth_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey2 = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey2,
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
                    AppIcons.pinterestLogo,
                    height: 100,
                  ),
                ),
              ),
              const SizedBox(height: 100),
              const Center(
                child: Text(
                  "Create Account Now",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: AppColors.black,
                    ),
                    hintText: "Your Name",
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
                  controller: email,
                  validator: (value) => Validation().emailUp(value),
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
                  validator: (value) => Validation().passwordUp(value),
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
                        if(_formKey2.currentState!.validate()){
                          AuthService().signUp(email.text, password.text);
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
                        "SignUp",
                      ),
                    ),
                  )),
              TextButton(
                onPressed: widget.onTap,
                child: const Text(
                  "SignIn",
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
      ),
    );
  }
}
