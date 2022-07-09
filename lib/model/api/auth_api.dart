import 'package:bookingvaccine/model/register_model.dart';
import 'package:dio/dio.dart';

class AuthApi {
  final String _baseUrl = 'http://35.247.142.238:80/api/v1/auth/';

  Future registerUser(RegisterModel paramRegisterModel) async {
    var _response = await Dio().post(
      _baseUrl + 'register',
      data: RegisterModel(
          username: paramRegisterModel.username,
          password: paramRegisterModel.password,
          firstName: paramRegisterModel.firstName,
          lastName: paramRegisterModel.lastName,
          birthDate: paramRegisterModel.birthDate,
          gender: paramRegisterModel.gender,
          email: paramRegisterModel.email,
          noPhone: paramRegisterModel.noPhone),
    );

    if (_response.statusCode == 200) {
      return _response.data['data'];
    } else {
      throw Exception('Failed to edit data');
    }
  }

  Future loginUser(String username, String password) async {
    try {
      var _response = await Dio().post(
        _baseUrl + 'login',
        data: {
          'username': username,
          'password': password,
        },
      );

      return _response.data['data'];
    } catch (e) {
      throw Exception('Failed to login');
    }
  }
}
