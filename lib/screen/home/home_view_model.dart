import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  bool clickButtonRegisterNow = false;
  bool clickButtonMore = false;

  changeClickButtonRegisterNow(bool paramClickButtonRegisterNow) {
    clickButtonRegisterNow = paramClickButtonRegisterNow;
    notifyListeners();
  }

  changeClickButtonMore(bool paramClickButtonMor) {
    clickButtonMore = paramClickButtonMor;
    notifyListeners();
  }
}
