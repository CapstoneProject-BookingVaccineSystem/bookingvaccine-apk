import 'package:flutter/cupertino.dart';

class FamillyViewModel extends ChangeNotifier {
  bool isExpaned = false;
  bool clickAdd = false;
  bool clickChange = false;
  int indexForm = 0;
  double heightDinamis = 0;

  List tes = [
    1,
    2,
  ];

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

  changeClickChange(bool paramClickChange) {
    clickChange = paramClickChange;
    notifyListeners();
  }

  changeHeightDinamis(double paramHeightDinamis) {
    heightDinamis = paramHeightDinamis;
    notifyListeners();
  }
}
