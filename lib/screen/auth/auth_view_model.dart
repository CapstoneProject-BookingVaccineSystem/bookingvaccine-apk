import 'package:flutter/cupertino.dart';

class SignInViewModel extends ChangeNotifier {
  bool isHidden = true;
  bool clickEnter = true;

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

  changeClickEnter(bool paramClickEnter) {
    clickEnter = paramClickEnter;
    notifyListeners();
  }
}

class SignUpViewModel extends ChangeNotifier {
  bool isHidden = true;
  late String gender;
  bool agree = false;
  String date = '';
  bool statusCheckbox = true;
  bool clickRegister = true;

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

  changeClickRegister(bool paramClickRegister) {
    clickRegister = paramClickRegister;
    notifyListeners();
  }

  String? get errorText {
    // at any time, we can get the text from _controller.value.text
    final text = nikC.text;

    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text != '') {
      if (text.length < 16) {
        return 'Panjang NIK harus 16';
      }
    }

    // return null if the text is valid
    return null;
  }

  setStateErrorText(String paramNikC) {
    print(paramNikC);
    if (paramNikC != '') {
      notifyListeners();
      errorText;
    }
  }
}
