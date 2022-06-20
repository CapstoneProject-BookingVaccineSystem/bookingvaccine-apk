import 'package:flutter/cupertino.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilViewModel extends ChangeNotifier {
  String date = '';
  String imageProfil = '';
  TextEditingController dateC = TextEditingController();

  getDataUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String? filePath = prefs.getString('imageProfil');
    imageProfil = filePath!;
    notifyListeners();
  }

  void changeDate(String paramDate) {
    date = paramDate;
    dateC = TextEditingController(text: paramDate);
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
