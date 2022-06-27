import 'package:bookingvaccine/constant/state.dart';
import 'package:bookingvaccine/model/api/user_api.dart';
import 'package:bookingvaccine/model/user_model.dart';
import 'package:bookingvaccine/screen/prompt/prompt.dart';
import 'package:flutter/cupertino.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilViewModel extends ChangeNotifier {
  String date = '';
  String imageProfil = '';
  String gender = '';
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

  getDataUser() async {
    UserModel _getDataUser = await UserApi().getUserById(8);

    user = _getDataUser;
    final prefs = await SharedPreferences.getInstance();
    final String? filePath = prefs.getString('imageProfil');

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
  }

  editUserById(UserModel paramUser, BuildContext paramContext) async {
    await UserApi().editUserByid(paramUser);
    Prompt().promptSucces(paramContext, 'Profil Berhasil Diperbarui');
  }

  editInformationUserById(
      UserModel paramUser, BuildContext paramContext) async {
    await UserApi().editUserByid(paramUser);
    Prompt().promptSucces(paramContext, 'Informasi Akun Berhasil Diperbarui');
  }

  changePasswordUserId(UserModel paramUser, BuildContext paramContext) async {
    await UserApi().editUserByid(paramUser);
    newPassword.clear();
    confirmPassword.clear();
    oldPassword.clear();
    await getDataUser();
    Prompt().promptSucces(paramContext, 'Password Berhasil Diperbarui');
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
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    final prefs = await SharedPreferences.getInstance();
    if (result != null) {
      PlatformFile file = result.files.first;
      imageProfil = file.path!;
      await prefs.setString('imageProfil', file.path!);
      notifyListeners();
    }
  }
}
