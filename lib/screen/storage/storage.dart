import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Future getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? _token = prefs.getString('token');
    return _token;
  }

  Future idUser() async {
    final prefs = await SharedPreferences.getInstance();
    final int? _idUser = prefs.getInt('idUser');
    return _idUser;
  }

  Future fullName() async {
    final prefs = await SharedPreferences.getInstance();
    final String? _fullName = prefs.getString('fullName');
    return _fullName;
  }
}
