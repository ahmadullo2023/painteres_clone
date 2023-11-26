import 'package:flutter/cupertino.dart';

class MainController extends ChangeNotifier {

  final List _favoriteList = [];

  List get favoriteList => _favoriteList;

  void addFavoriteList(String favorite){
    _favoriteList.add(favorite);
  }

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
