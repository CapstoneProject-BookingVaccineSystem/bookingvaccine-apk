import 'package:bookingvaccine/model/user_model.dart';
import 'package:dio/dio.dart';

import '../../screen/storage/storage.dart';

class UserApi {
  final _baseUrl = 'http://35.247.142.238/api/v1/users/';

  getUserById(int id) async {
    try {
      final String _token = await Storage().getToken();
      final _response = await Dio().get(_baseUrl + id.toString(),
          options: Options(
            headers: {
              "authorization": "Bearer $_token",
            },
          ));
      UserModel dataUser = UserModel.fromJson(_response.data['data']);

      return dataUser;
    } catch (e) {
      throw Exception(e);
    }
  }

  editUserByid(UserModel user) async {
    try {
      final String _token = await Storage().getToken();
      final int idUser = await Storage().idUser();
      await Dio().put(_baseUrl + idUser.toString(),
          data: UserModel(
              createdAt: user.createdAt,
              createdBy: user.createdBy,
              isDeleted: user.isDeleted,
              idUser: user.idUser,
              username: user.username,
              password: user.password,
              firstName: user.firstName,
              lastName: user.lastName,
              birthDate: user.birthDate,
              gender: user.gender,
              email: user.email,
              noPhone: user.noPhone,
              roles: user.roles),
          options: Options(
            headers: {
              "authorization": "Bearer $_token",
            },
          ));
    } catch (e) {
      throw Exception('Failed to edit data');
    }
  }
}
