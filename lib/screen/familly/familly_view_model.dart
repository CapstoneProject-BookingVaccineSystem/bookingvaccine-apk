import 'package:flutter/cupertino.dart';

class FamillyViewModel extends ChangeNotifier {
  bool isExpaned = false;
  bool clickAdd = false;
  int indexForm = 0;

  void changeisExpaned(bool paramisExpaned, int paramIndexForm) {
    if (paramisExpaned == true) {
      isExpaned = false;
      indexForm = paramIndexForm;
    } else {
      isExpaned = true;
      indexForm = paramIndexForm;
    }

    notifyListeners();
  }

  changeClickAdd(bool paramClickAdd) {
    clickAdd = paramClickAdd;
    notifyListeners();
  }
}
