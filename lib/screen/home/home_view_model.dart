import 'package:bookingvaccine/constant/state.dart';
import 'package:bookingvaccine/model/api/news_api.dart';
import 'package:bookingvaccine/model/news_model/news_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/api/user_api.dart';
import '../../model/user_model.dart';
import '../storage/storage.dart';

class HomeViewModel extends ChangeNotifier {
  bool clickButtonRegisterNow = false;
  bool clickButtonMore = false;

  StatusState state = StatusState.loding;
  List<NewsModel> dataNews = [];

  late String fullName;
  String imageProfil = '';

  changeStatusState(StatusState s) {
    state = s;
    notifyListeners();
  }

  getDataHome() async {
    changeStatusState(StatusState.loding);

    final prefs = await SharedPreferences.getInstance();
    final int idUser = await Storage().idUser();
    UserModel _dataUser = await UserApi().getUserById(idUser);

    List<NewsModel> _data = await NewsApi().getFiveDataNews();

    dataNews = _data;

    final String _fullName = '${_dataUser.firstName} ${_dataUser.lastName}';
    fullName = _fullName;

    final String? _filePath = prefs.getString('imageProfil');

    if (_filePath != null) {
      imageProfil = _filePath;
    }

    notifyListeners();
    changeStatusState(StatusState.none);
  }

  changeClickButtonRegisterNow(bool paramClickButtonRegisterNow) {
    clickButtonRegisterNow = paramClickButtonRegisterNow;
    notifyListeners();
  }

  changeClickButtonMore(bool paramClickButtonMor) {
    clickButtonMore = paramClickButtonMor;
    notifyListeners();
  }
}
