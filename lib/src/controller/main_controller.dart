import 'package:flutter/cupertino.dart';

class MainController extends ChangeNotifier {
  Locale locale = const Locale("uz");

  void changeLocale(Locale newLocale) {
    locale = newLocale;
    notifyListeners();
  }

  bool switchButton = true;

  void switchPage() {
    switchButton =! switchButton;
    notifyListeners();
  }
}
