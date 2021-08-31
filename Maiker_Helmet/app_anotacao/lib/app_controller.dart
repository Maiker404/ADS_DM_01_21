import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {
  static AppController instance = new AppController();

  bool isDark = false;

  List<Map<String, String>> listAnotacao = [];

  changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }

  addItem(item) {
    listAnotacao.add(item);
    notifyListeners();
  }

  removeItem(index) {
    listAnotacao.removeAt(index);
    notifyListeners();
  }
}
