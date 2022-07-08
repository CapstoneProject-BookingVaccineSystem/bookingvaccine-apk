import 'dart:async';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:bookingvaccine/model/api/auth_api.dart';
import 'package:bookingvaccine/model/register_model.dart';
import 'package:bookingvaccine/screen/prompt/prompt.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

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

  loginUser(
      String paramUsernamse, String paramPassword, BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final _token = await AuthApi().loginUser(paramUsernamse, paramPassword);

      await prefs.setString(
        'token',
        _token['token'],
      );

      Map<String, dynamic> _decodedToken = JwtDecoder.decode(_token.toString());

      String _fullName = _decodedToken['firstName'] + _decodedToken['lastName'];

      await prefs.setString(
        'fullName',
        _fullName,
      );

      await prefs.setInt(
        'idUser',
        _decodedToken['id_user'],
      );

      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Nik Atau Password Salah',
        btnOkOnPress: () {},
      ).show();
    }
  }
}

class SignUpViewModel extends ChangeNotifier {
  bool isHidden = true;
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
    if (paramNikC != '') {
      notifyListeners();
      errorText;
    }
  }

  registerUser(RegisterModel registerModel, BuildContext context) async {
    try {
      await AuthApi().registerUser(registerModel);

      Prompt().promptSucces(context, 'Berhasil Daftar Akun, Silahkan Login');
      Timer(
        const Duration(seconds: 3),
        () {
          Navigator.of(context).pop();
          firstNameC.clear();
          lastNameC.clear();
          emailC.clear();
          passwordC.clear();
          nikC.clear();
          numberC.clear();
        },
      );
    } catch (e) {}
  }
}
