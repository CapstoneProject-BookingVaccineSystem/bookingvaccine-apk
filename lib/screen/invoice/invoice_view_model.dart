import 'package:flutter/cupertino.dart';

class InvoiceViewModel extends ChangeNotifier {
  bool clickBackToHome = false;

  changeClickBackToHome(bool paramClickBackToHome) {
    clickBackToHome = paramClickBackToHome;
    notifyListeners();
  }
}
