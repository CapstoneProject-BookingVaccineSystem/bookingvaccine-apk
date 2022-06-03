import 'package:flutter/cupertino.dart';

class SignInViewModel extends ChangeNotifier {
  bool isHidden = true;

  TextEditingController nikC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  void changeIsHidden(bool paramIsHidden) {
    if (paramIsHidden == true) {
      isHidden = false;
    } else {
      isHidden = true;
    }
    notifyListeners();
  }
}
