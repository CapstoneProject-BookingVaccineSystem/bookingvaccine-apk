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

class SignUpViewModel extends ChangeNotifier {
  bool isHidden = true;
  late String gender;
  bool agree = false;
  String date = '';
  bool statusCheckbox = true;

  TextEditingController firstNameC = TextEditingController();
  TextEditingController lastNameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController nikC = TextEditingController();
  TextEditingController numberC = TextEditingController();
  TextEditingController dateC = TextEditingController();

  void changeIsHidden(bool paramIsHidden) {
    if (paramIsHidden == true) {
      isHidden = false;
    } else {
      isHidden = true;
    }
    notifyListeners();
  }

  bool validatePassword(String pass) {
    RegExp _passValid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])");
    String _password = pass.trim();

    if (_passValid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  void changeDate(String paramDate) {
    date = paramDate;
    dateC = TextEditingController(text: paramDate);
    notifyListeners();
  }

  void changeAgree(bool paramAgree) {
    agree = paramAgree;
    notifyListeners();
  }

  void changestatusCheckbox(bool paramAgree) {
    if (paramAgree == true) {
      statusCheckbox = true;
    } else {
      statusCheckbox = false;
    }
    notifyListeners();
  }
}
