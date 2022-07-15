import 'package:flutter/cupertino.dart';

class EkslusifViewModel extends ChangeNotifier {
  bool contenOne = false,
      contenTwo = false,
      contenThree = false,
      contenFour = false,
      contenFive = false;

  changeContenOne(bool paramContenOne) {
    contenOne = paramContenOne;
    notifyListeners();
  }

  changeContenTwo(bool paramcontenTwo) {
    contenTwo = paramcontenTwo;
    notifyListeners();
  }

  changeContenThree(bool paramcontenThree) {
    contenThree = paramcontenThree;
    notifyListeners();
  }

  changeContenFour(bool paramcontenFour) {
    contenFour = paramcontenFour;
    notifyListeners();
  }

  changeContenFive(bool paramcontenFive) {
    contenFive = paramcontenFive;
    notifyListeners();
  }
}
