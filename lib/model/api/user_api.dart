import 'package:bookingvaccine/model/user_model.dart';
import 'package:dio/dio.dart';

class UserApi {
  final _baseUrl = 'http://35.247.142.238/api/v1/users/';

  getUserById(int id) async {
    try {
      final _response = await Dio().get(_baseUrl + id.toString());
      UserModel dataUser = UserModel.fromJson(_response.data['data']);

      return dataUser;
    } catch (e) {
      throw Exception('Failed to get data');
    }
  }

  editUserByid(UserModel user) async {
    try {
      await Dio().put(_baseUrl + 8.toString(),
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
              roles: user.roles));
    } catch (e) {
      throw Exception('Failed to edit data');
    }
  }
}
