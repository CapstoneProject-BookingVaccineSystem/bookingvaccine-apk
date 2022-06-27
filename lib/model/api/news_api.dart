import 'package:bookingvaccine/model/news_model/news_model.dart';
import 'package:dio/dio.dart';

class NewsApi {
  final _baseUrl = 'http://35.247.142.238/api/v1/news/';

  getAllDataNews() async {
    try {
      final _response = await Dio().get(_baseUrl + 'desc');

      List<dynamic> _getAllDataNews = _response.data;
      List<NewsModel> _allDataNews = [];

      for (var element in _getAllDataNews) {
        _allDataNews.add(NewsModel.fromJson(element));
      }

      return _allDataNews;
    } catch (e) {
      throw Exception('Failed to get data');
    }
  }

  getDetailNewsById(int id) async {
    try {
      final _response = await Dio().get(_baseUrl + id.toString());
      NewsModel dataNews = NewsModel.fromJson(_response.data['data']);
      return dataNews;
    } catch (e) {
      throw Exception('Failed to get detail data');
    }
  }
}
