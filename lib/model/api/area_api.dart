import 'package:bookingvaccine/model/area_model.dart';

import 'package:dio/dio.dart';

import '../../screen/storage/storage.dart';

class AreaApi {
  final String _baseUrl = 'http://bookingvaccine.herokuapp.com/api/v1/area';

  Future getAllDataArea() async {
    final String _token = await Storage().getToken();
    final _response = await Dio().get(_baseUrl,
        options: Options(
          headers: {
            "authorization": "Bearer $_token",
          },
        ));
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
