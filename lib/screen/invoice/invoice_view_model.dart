import 'package:flutter/cupertino.dart';

class InvoiceViewModel extends ChangeNotifier {
  bool clickBackToHome = false;
  int clickCardListBooking = 0;

  changeClickBackToHome(bool paramClickBackToHome) {
    clickBackToHome = paramClickBackToHome;
    notifyListeners();
  }

  changeClickCardListBooking(int paramClickCardListBooking) {
    clickCardListBooking = paramClickCardListBooking;
    notifyListeners();
  }
}
