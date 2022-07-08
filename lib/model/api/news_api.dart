import 'package:bookingvaccine/model/news_model/news_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsApi {
  final _baseUrl = 'http://35.247.142.238/api/v1/news/';

  Future getAllDataNews() async {
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

  Future getFiveDataNews() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final String? _token = prefs.getString('token');

      final _response = await Dio().get(_baseUrl + '0/5',
          options: Options(
            headers: {
              "authorization": "Bearer ${_token!}",
            },
          ));

      List<dynamic> _fiveDataNews = _response.data['data']['content'];
      List<NewsModel> _data = [];

      for (var element in _fiveDataNews) {
        _data.add(NewsModel.fromJson(element));
      }
      return _data;
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
