import 'package:bookingvaccine/constant/state.dart';
import 'package:bookingvaccine/model/api/booking_api.dart';
import 'package:bookingvaccine/model/detail_booking_model.dart';
import 'package:flutter/cupertino.dart';

class InvoiceViewModel extends ChangeNotifier {
  bool clickBackToHome = false;
  int clickCardListBooking = 0;

  late DetailBookingModel dataDetailBookingById;

  StatusState state = StatusState.loding;

  changeState(StatusState s) {
    state = s;
    notifyListeners();
  }

  changeClickBackToHome(bool paramClickBackToHome) {
    clickBackToHome = paramClickBackToHome;
    notifyListeners();
  }

  changeClickCardListBooking(int paramClickCardListBooking) {
    clickCardListBooking = paramClickCardListBooking;
    notifyListeners();
  }

  getBookingById(int paramId) async {
    try {
      changeState(StatusState.loding);
      DetailBookingModel _getDetailDataBookingById =
          await BookingApi().getDetailBookingById(paramId);

      dataDetailBookingById = _getDetailDataBookingById;

      changeState(StatusState.none);

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
