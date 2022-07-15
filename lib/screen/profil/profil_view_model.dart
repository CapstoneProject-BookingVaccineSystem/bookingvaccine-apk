import 'package:bookingvaccine/constant/state.dart';
import 'package:bookingvaccine/model/api/auth_api.dart';
import 'package:bookingvaccine/model/api/user_api.dart';
import 'package:bookingvaccine/model/user_model.dart';
import 'package:bookingvaccine/screen/prompt/prompt.dart';
import 'package:bookingvaccine/screen/storage/storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../component/loading_screen.dart';
import '../home/home_view_model.dart';

class ProfilViewModel extends ChangeNotifier {
  String date = '';
  String imageProfil = '';
  String gender = '';
  String validatePassword = '';
  late UserModel user;

  TextEditingController dateC = TextEditingController();
  TextEditingController firstNameC = TextEditingController();
  TextEditingController lastNameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController nikC = TextEditingController();
  TextEditingController phoneNumberC = TextEditingController();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  StatusState state = StatusState.loding;

  changeStatusState(StatusState s) {
    state = s;
    notifyListeners();
  }

  getDataUser() async {
    int _idUser = await Storage().idUser();
    UserModel _getDataUser = await UserApi().getUserById(_idUser);

    user = _getDataUser;
    final prefs = await SharedPreferences.getInstance();
    final String? filePath = prefs.getString('imageProfil');
    final String? _validatePassword = prefs.getString('password');

    validatePassword = _validatePassword!;
    gender = user.gender;
    date = user.birthDate.toString().substring(0, 10);
    dateC =
        TextEditingController(text: user.birthDate.toString().substring(0, 10));

    firstNameC = TextEditingController(text: user.firstName);

    lastNameC = TextEditingController(text: user.lastName);

    emailC = TextEditingController(text: user.email);

    nikC = TextEditingController(text: user.username);

    phoneNumberC = TextEditingController(text: user.noPhone);

    if (filePath == null) {
      imageProfil = '';
    } else {
      imageProfil = filePath;
    }

    notifyListeners();
    changeStatusState(StatusState.none);
  }

  editUserById(UserModel paramUser, BuildContext paramContext) async {
    try {
      await UserApi().editUserByid(paramUser);
      Navigator.pop(paramContext);
      Prompt().promptSucces(paramContext, 'Profil Berhasil Diperbarui');
    } catch (e) {
      Navigator.pop(paramContext);
    }
  }

  editInformationUserById(
      UserModel paramUser, BuildContext paramContext) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await UserApi().editUserByid(paramUser);
      Navigator.pop(paramContext);
      Prompt().promptSucces(paramContext, 'Informasi Akun Berhasil Diperbarui');

      final _token = await AuthApi().loginUser(nikC.text, 'Akil1221');

      await prefs.setString(
        'token',
        _token['token'],
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  changePasswordUserId(UserModel paramUser, BuildContext paramContext) async {
    try {
      await UserApi().editUserByid(paramUser);
      newPassword.clear();
      confirmPassword.clear();
      oldPassword.clear();
      await getDataUser();
      Prompt().promptSucces(paramContext, 'Password Berhasil Diperbarui');
    } catch (e) {
      throw Exception(e);
    }
  }

  void changeDate(String paramDate) {
    date = paramDate;
    dateC = TextEditingController(text: paramDate);
    notifyListeners();
  }

  void changeGender(String paramGender) {
    gender = paramGender;
    notifyListeners();
  }

  pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      final prefs = await SharedPreferences.getInstance();
      if (result != null) {
        PlatformFile file = result.files.first;
        imageProfil = file.path!;
        await prefs.setString('imageProfil', file.path!);
        notifyListeners();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  getDataHome(BuildContext context) async {
    try {
      var _viewModel = Provider.of<HomeViewModel>(context, listen: false);
      await _viewModel.getDataHome();
      Navigator.pop(context);
    } catch (e) {
      throw Exception(e);
    }
  }

  showLoaderDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => const Dialog(
              backgroundColor: Colors.transparent,
              child: LoadingScreen(),
            ));
  }
}
