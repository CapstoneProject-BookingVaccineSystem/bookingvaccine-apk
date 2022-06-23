import 'package:bookingvaccine/model/api/news_api.dart';
import 'package:bookingvaccine/model/news_model/news_model.dart';
import 'package:flutter/cupertino.dart';

class NewsViewModel extends ChangeNotifier {
  List<NewsModel> allDataNews = [];

  late NewsModel detailDataNews;

  getAllDataNews() async {
    final _getAllDataNews = await NewsApi().getAllDataNews();

    allDataNews = _getAllDataNews;
    notifyListeners();
  }

  getDetailDataNewsById(int paramId) async {
    final getDetailDataNews = await NewsApi().getDetailNewsById(paramId);
    detailDataNews = getDetailDataNews;
    notifyListeners();
  }
}
