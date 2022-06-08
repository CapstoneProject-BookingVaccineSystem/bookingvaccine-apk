import 'package:flutter/cupertino.dart';

class ConfirmVaksinasiViewModel extends ChangeNotifier {
  bool clickBookingNow = false;
  bool clickAdd = false;

  changeClickBookingNow(bool paramClickBookinNow) {
    clickBookingNow = paramClickBookinNow;
    notifyListeners();
  }

  changeClickAdd(bool paramClickAdd) {
    clickAdd = paramClickAdd;
    notifyListeners();
  }
}
