import 'dart:async';
import 'package:bookingvaccine/model/detail_booking_model.dart';
import 'package:bookingvaccine/model/list_booking.dart';
import 'package:bookingvaccine/screen/storage/storage.dart';
import 'package:dio/dio.dart';

class BookingApi {
  final _baseUrl = 'https://bookingvaccine.herokuapp.com/api/v1/booking/';

  Future getAllDataBookingByUserId() async {
    try {
      final String _token = await Storage().getToken();
      final int _idUser = await Storage().idUser();
      final _response = await Dio().get(_baseUrl + 'user/' + _idUser.toString(),
          options: Options(
            headers: {
              "authorization": "Bearer $_token",
            },
          ));

      List<dynamic> _getAllDataBookingByUserId = _response.data['data'];
      List<BookingModel> _dataBookingByUserId = [];

      for (var element in _getAllDataBookingByUserId) {
        _dataBookingByUserId.add(BookingModel.fromJson(element));
      }

      return _dataBookingByUserId;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future addBookingApiWithFamilly(String idFamilly, String idSession) async {
    try {
      final String _token = await Storage().getToken();
      final int _idUser = await Storage().idUser();
      final _response = await Dio().post(_baseUrl + 'family',
          data: {
            "id_family": idFamilly,
            "id_session": idSession,
            "id_user": _idUser
          },
          options: Options(
            headers: {
              "authorization": "Bearer $_token",
            },
          ));

      return _response.data['data']['id_booking'];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future addBookingApiWithJustUser(String idSession) async {
    try {
      final String _token = await Storage().getToken();
      final int _idUser = await Storage().idUser();
      final _response = await Dio().post(_baseUrl + 'user',
          data: {
            "id_user": _idUser,
            "id_session": idSession,
          },
          options: Options(
            headers: {
              "authorization": "Bearer $_token",
            },
          ));
      return _response.data['data']['id_booking'];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future getDetailBookingById(int id) async {
    try {
      final String _token = await Storage().getToken();

      final _response = await Dio().get(_baseUrl + id.toString(),
          options: Options(
            headers: {
              "authorization": "Bearer $_token",
            },
          ));

      DetailBookingModel _getDetailBookingById =
          DetailBookingModel.fromJson(_response.data['data']);
      return _getDetailBookingById;
    } catch (e) {
      print(e);
    }
  }
}
