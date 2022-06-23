import 'package:bookingvaccine/model/familly_model/add_fimilly_model.dart';
import 'package:bookingvaccine/model/familly_model/detail_familly.dart';
import 'package:bookingvaccine/model/familly_model/familly_model.dart';
import 'package:dio/dio.dart';

class FamillyApi {
  final _baseUrl = 'http://34.142.219.145/api/v1/family/';

  Future getDataFamillyByUserId(int id) async {
    try {
      final _response = await Dio().get(_baseUrl + 'user/' + id.toString());

      List<dynamic> _getAllDataFamillyByUserId = _response.data['data'];
      List<FamillyModel> _allDataFamillyByUserId = [];

      for (var element in _getAllDataFamillyByUserId) {
        _allDataFamillyByUserId.add(FamillyModel.fromJson(element));
      }

      return _allDataFamillyByUserId;
    } catch (e) {
      List<FamillyModel> _allDataFamillyByUserIdNull = [];
      return _allDataFamillyByUserIdNull;
    }
  }

  Future getDataFamillyById(int id) async {
    try {
      final _response = await Dio().get(_baseUrl + id.toString());

      Map<String, dynamic> _getDataFamillyById = _response.data['data'];

      DetailFamillyModel detailDataFamilly =
          DetailFamillyModel.fromJson(_getDataFamillyById);

      return detailDataFamilly;
    } catch (e) {}
  }

  Future addDataFamilly(AddFamillyModel familly) async {
    try {
      await Dio().post(_baseUrl,
          data: AddFamillyModel(
              fullName: familly.fullName, idUser: 23, nik: familly.nik));
    } catch (e) {}
  }

  Future detailFamilly(DetailFamillyModel detailFamillyModel) async {
    final _response = await Dio().put(
      _baseUrl + detailFamillyModel.idFamily.toString(),
      data: DetailFamillyModel(
          nik: detailFamillyModel.nik,
          fullName: detailFamillyModel.fullName,
          idFamily: detailFamillyModel.idFamily),
    );

    print(_response.statusCode);
  }

  Future deleteDataFamillyById(int id) async {
    try {
      await Dio().delete(_baseUrl + id.toString());
      return 200;
    } catch (e) {
      return 200;
    }
  }
}
