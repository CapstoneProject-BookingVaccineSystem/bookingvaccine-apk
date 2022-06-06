import 'package:flutter/cupertino.dart';

class VaksinasiViewModel extends ChangeNotifier {
  bool clickContent = false;
  bool clickChoose = false;
  int indexContent = 0;

  changeClickContent(bool paramClickContent, int paramIndexContent) {
    clickContent = paramClickContent;
    indexContent = paramIndexContent;
    notifyListeners();
  }

  changeClickChoose(bool paramClickChoose) {
    clickChoose = paramClickChoose;
    notifyListeners();
  }
}
