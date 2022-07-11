import 'package:bookingvaccine/model/familly_model/add_fimilly_model.dart';
import 'package:bookingvaccine/model/familly_model/detail_familly.dart';
import 'package:bookingvaccine/model/familly_model/familly_model.dart';
import 'package:dio/dio.dart';

import '../../screen/storage/storage.dart';

class FamillyApi {
  final _baseUrl = 'https://bookingvaccine.herokuapp.com/api/v1/family/';

  Future getDataFamillyByUserId(int id) async {
    try {
      final String _token = await Storage().getToken();
      final _response = await Dio().get(_baseUrl + 'user/' + id.toString(),
          options: Options(
            headers: {
              "authorization": "Bearer $_token",
            },
          ));

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
      final String _token = await Storage().getToken();
      final _response = await Dio().get(
        _baseUrl + id.toString(),
        options: Options(
          headers: {
            "authorization": "Bearer $_token",
          },
        ),
      );

      Map<String, dynamic> _getDataFamillyById = _response.data['data'];

      DetailFamillyModel detailDataFamilly =
          DetailFamillyModel.fromJson(_getDataFamillyById);

      return detailDataFamilly;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future addDataFamilly(AddFamillyModel familly) async {
    try {
      final String _token = await Storage().getToken();
      int _idUser = await Storage().idUser();
      await Dio().post(
        _baseUrl,
        data: AddFamillyModel(
            fullName: familly.fullName, idUser: _idUser, nik: familly.nik),
        options: Options(
          headers: {
            "authorization": "Bearer $_token",
          },
        ),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future detailFamilly(DetailFamillyModel detailFamillyModel) async {
    final String _token = await Storage().getToken();
    await Dio().put(
      _baseUrl + detailFamillyModel.idFamily.toString(),
      data: DetailFamillyModel(
          nik: detailFamillyModel.nik,
          fullName: detailFamillyModel.fullName,
          idFamily: detailFamillyModel.idFamily),
      options: Options(
        headers: {
          "authorization": "Bearer $_token",
        },
      ),
    );
  }

  Future deleteDataFamillyById(int id) async {
    try {
      final String _token = await Storage().getToken();
      await Dio().delete(
        _baseUrl + id.toString(),
        options: Options(
          headers: {
            "authorization": "Bearer $_token",
          },
        ),
      );
      return 200;
    } catch (e) {
      return null;
    }
  }
}
