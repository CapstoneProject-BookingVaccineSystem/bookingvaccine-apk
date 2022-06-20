import 'dart:convert';

import 'package:bookingvaccine/model/register_model.dart';
import 'package:dio/dio.dart';

class AuthApi {
  final String _baseUrl = 'http://34.142.219.145/api/v1/users';
  Future registerUser(RegisterModel paramRegisterModel) async {
    var _response = await Dio().post(
      _baseUrl,
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
}
