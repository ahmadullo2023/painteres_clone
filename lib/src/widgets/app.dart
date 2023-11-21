import 'package:flutter/material.dart';
import 'package:painteres_clone/src/pages/page_builder.dart';

import '../pages/register_page.dart';



class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}
