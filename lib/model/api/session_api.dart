import 'package:bookingvaccine/model/session_model.dart';
import 'package:dio/dio.dart';

class SessionApi {
  final _baseUrl = 'http://34.142.219.145/api/v1/session/';

  Future getDataSessionByAreaId(int id) async {
    final _response = await Dio().get(_baseUrl + 'area/' + id.toString());

    if (_response.statusCode == 200) {
      List<dynamic> getAllDataSessionByAreaId = _response.data['data'];

      List<SessionModel> dataSessionByAreaId = [];

      for (var element in getAllDataSessionByAreaId) {
        dataSessionByAreaId.add(SessionModel.fromJson(element));
      }

      return dataSessionByAreaId;
    } else {
      throw Exception('Failed to edit data');
    }
  }

  Future getDetailDataSessionById(int id) async {
    try {
      final _response = await Dio().get(_baseUrl + id.toString());
    } catch (e) {}
  }
}