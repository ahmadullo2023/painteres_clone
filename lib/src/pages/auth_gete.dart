import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:painteres_clone/src/pages/page_builder.dart';
import 'package:painteres_clone/src/pages/switch_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return const PageBuilder();
          }else{
            return const SwitchPage();
          }
        },
      ),
    );
  }
}
