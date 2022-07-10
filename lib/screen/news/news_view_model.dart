import 'package:bookingvaccine/constant/state.dart';
import 'package:bookingvaccine/model/api/news_api.dart';
import 'package:bookingvaccine/model/news_model/news_model.dart';
import 'package:flutter/cupertino.dart';

class NewsViewModel extends ChangeNotifier {
  List<NewsModel> allDataNews = [];

  late NewsModel detailDataNews;

  StatusState state = StatusState.loding;

  changeStatusState(StatusState s) {
    state = s;
    notifyListeners();
  }

  getAllDataNews() async {
    changeStatusState(StatusState.loding);
    final _getAllDataNews = await NewsApi().getAllDataNews();

    allDataNews = _getAllDataNews;
    notifyListeners();
    changeStatusState(StatusState.none);
  }

  getDetailDataNewsById(int paramId) async {
    final getDetailDataNews = await NewsApi().getDetailNewsById(paramId);
    detailDataNews = getDetailDataNews;
    notifyListeners();
  }
}
