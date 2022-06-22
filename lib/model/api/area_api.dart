import 'package:bookingvaccine/model/area_model.dart';

import 'package:dio/dio.dart';

class AreaApi {
  final String _baseUrl = 'http://34.142.219.145/api/v1/area';

  Future getAllDataArea() async {
    final _response = await Dio().get(_baseUrl);
    if (_response.statusCode == 200) {
      List<dynamic> getAllDataArea = _response.data['data'];
      List<AreaModel> getData = [];

      for (var element in getAllDataArea) {
        getData.add(AreaModel.fromJson(element));
      }
      return getData;
    } else {
      throw Exception('Failed Get Data');
    }
  }
}
