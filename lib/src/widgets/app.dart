import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:painteres_clone/src/pages/home_page.dart';


import 'package:provider/provider.dart';

import '../controller/main_controller.dart';



class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainController(),
      builder: (context, child) {
        final locale = Provider.of<MainController>(context).locale;
        return MaterialApp(
          locale: locale,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale("en"),
            Locale("uz"),
          ],
          home: const HomePage()
        );
      },
    );
  }
}
