import 'package:bookingvaccine/constant/state.dart';
import 'package:bookingvaccine/model/api/news_api.dart';
import 'package:bookingvaccine/model/news_model/news_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends ChangeNotifier {
  bool clickButtonRegisterNow = false;
  bool clickButtonMore = false;

  StatusState state = StatusState.loding;
  List<NewsModel> dataNews = [];

  late String fullName;
  String imageProfil = 'assets/default_profil.png';

  changeStatusState(StatusState s) {
    state = s;
    notifyListeners();
  }

  getDataHome() async {
    changeStatusState(StatusState.loding);

    final prefs = await SharedPreferences.getInstance();

    List<NewsModel> _data = await NewsApi().getFiveDataNews();

    dataNews = _data;

    final String? _fullName = prefs.getString('fullName');
    final String? _filePath = prefs.getString('imageProfil');
    fullName = _fullName!;

    print(dataNews[0].image);
    imageProfil = _filePath ?? 'assets/default_profil.png';
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
