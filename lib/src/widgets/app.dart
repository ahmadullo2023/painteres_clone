import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:painteres_clone/src/pages/auth_gete.dart';

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
        return ValueListenableBuilder(
            valueListenable: Hive.box("openBox").listenable(),
            builder: (context, box, child) {
              final getBox = box.get("is_dark", defaultValue: false);
              return MaterialApp(
                  locale: locale,
                  theme: getBox
                      ? ThemeData.dark(useMaterial3: false)
                      : ThemeData.light(
                          useMaterial3: false,
                        ),
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
                  home: AuthGate());
            });
      },
    );
  }
}
