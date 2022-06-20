import 'package:flutter/cupertino.dart';

class ProfilViewModel extends ChangeNotifier {
  String date = '';
  TextEditingController dateC = TextEditingController();

  void changeDate(String paramDate) {
    date = paramDate;
    dateC = TextEditingController(text: paramDate);
    notifyListeners();
  }
}
