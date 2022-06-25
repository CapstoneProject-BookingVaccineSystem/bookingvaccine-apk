import 'package:bookingvaccine/model/api/familly_api.dart';
import 'package:bookingvaccine/model/familly_model/familly_model.dart';
import 'package:bookingvaccine/model/session_model/session_detail_model.dart';
import 'package:bookingvaccine/model/session_model/session_model.dart';
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

      DetailSessionModel _detailDataSession =
          DetailSessionModel.fromJson(_response.data['data']);

      List<FamillyModel> _responseDataFamilly =
          await FamillyApi().getDataFamillyByUserId(23);

      return [_detailDataSession, _responseDataFamilly];
    } catch (e) {}
  }
}
