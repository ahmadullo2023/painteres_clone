import 'package:flutter/material.dart';
import 'package:painteres_clone/src/pages/home_page.dart';

import 'navigation_bar.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavBar(),
    );
  }
}
