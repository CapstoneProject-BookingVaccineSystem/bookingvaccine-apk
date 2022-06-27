import 'dart:async';
import 'package:bookingvaccine/model/detail_booking_model.dart';
import 'package:bookingvaccine/model/list_booking.dart';
import 'package:dio/dio.dart';

class BookingApi {
  final _baseUrl = 'http://35.247.142.238/api/v1/booking/';

  Future getAllDataBookingByUserId(int id) async {
    try {
      final _response = await Dio().get(_baseUrl + 'user/' + 8.toString());

      List<dynamic> _getAllDataBookingByUserId = _response.data['data'];
      List<BookingModel> _dataBookingByUserId = [];

      for (var element in _getAllDataBookingByUserId) {
        _dataBookingByUserId.add(BookingModel.fromJson(element));
      }

      return _dataBookingByUserId;
    } catch (e) {
      throw Exception('Failed to get data booking by user id');
    }
  }

  Future addBookingApi(
      String idFamilly, String idSession, String idUser) async {
    try {
      final _response = await Dio().post(_baseUrl, data: {
        "id_family": idFamilly,
        "id_session": idSession,
        "id_user": idUser
      });

      return _response.data['data']['id_booking'];
    } catch (e) {
      throw Exception('Failed to add data');
    }
  }

  Future getDetailBookingById(int id) async {
    try {
      final _response = await Dio().get(_baseUrl + id.toString());

      DetailBookingModel _getDetailBookingById =
          DetailBookingModel.fromJson(_response.data['data']);

      return _getDetailBookingById;
    } catch (e) {
      throw Exception('Failed to get data detail');
    }
  }
}
