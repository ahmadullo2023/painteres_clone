import 'package:flutter/material.dart';
import 'package:painteres_clone/src/controller/main_controller.dart';
import 'package:painteres_clone/src/pages/sign_in_page.dart';
import 'package:painteres_clone/src/pages/sign_up_page.dart';
import 'package:provider/provider.dart';

class SwitchPage extends StatelessWidget {
  const SwitchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final switchBool = Provider.of<MainController>(context).switchButton;
    final function = Provider.of<MainController>(context).switchPage;
    if(switchBool){
      return SignIn(onTap: function);
    }else{
      return SignUp(onTap: function);
    }
  }
}
