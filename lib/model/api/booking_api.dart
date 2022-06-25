import 'dart:async';

import 'package:bookingvaccine/model/detail_booking_model.dart';
import 'package:bookingvaccine/model/familly_model/detail_familly.dart';
import 'package:dio/dio.dart';

class BookingApi {
  final _baseUrl = 'http://34.142.219.145/api/v1/booking/';

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
    } catch (e) {}
  }
}
