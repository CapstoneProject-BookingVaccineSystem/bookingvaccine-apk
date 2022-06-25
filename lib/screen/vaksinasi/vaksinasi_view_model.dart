import 'package:bookingvaccine/model/api/area_api.dart';
import 'package:bookingvaccine/model/api/booking_api.dart';
import 'package:bookingvaccine/model/api/session_api.dart';
import 'package:bookingvaccine/model/area_model.dart';
import 'package:bookingvaccine/model/familly_model/familly_model.dart';
import 'package:bookingvaccine/model/session_model/session_detail_model.dart';
import 'package:bookingvaccine/model/session_model/session_model.dart';
import 'package:bookingvaccine/screen/invoice/invoice_screen.dart';
import 'package:bookingvaccine/screen/invoice/invoice_view_model.dart';
import 'package:flutter/material.dart';

class VaksinasiViewModel extends ChangeNotifier {
  bool clickContent = false;
  bool clickChoose = false;
  bool clickKelurahan = false;
  bool clickBookingNow = false;
  bool clickAdd = false;
  int indexContent = 0;
  int idContent = 0;
  int idFamilly = 0;
  String? famillyName;
  late String famillyNameC;

  late DetailSessionModel detailDataSession;

  List<AreaModel> dataArea = [];
  List<SessionModel> dataSessionByAreaId = [];
  List<FamillyModel> allDataFamillyByUserId = [];
  late List<bool> isChecked;

  changeClickContent(
      bool paramClickContent, int paramIndexContent, int paramIdContent) {
    clickContent = paramClickContent;
    indexContent = paramIndexContent;
    idContent = paramIdContent;

    notifyListeners();
  }

  changeClickChoose(bool paramClickChoose) {
    clickChoose = paramClickChoose;
    notifyListeners();
  }

  changeClickKelurahan(bool paramClickKelurahan) {
    clickKelurahan = paramClickKelurahan;
    dataSessionByAreaId = [];
    notifyListeners();
  }

  changeClickBookingNow(bool paramClickBookinNow) {
    clickBookingNow = paramClickBookinNow;
    notifyListeners();
  }

  changeClickAdd(bool paramClickAdd) {
    clickAdd = paramClickAdd;
    notifyListeners();
  }

  changeClickBox(
      bool paramClickBox, index, int paramIdFamilly, String paramFamillyName) {
    isChecked = List<bool>.filled(allDataFamillyByUserId.length, false);
    isChecked[index] = paramClickBox;
    idFamilly = paramIdFamilly;
    famillyNameC = paramFamillyName;
    notifyListeners();
  }

  void deleteFamilly(BuildContext context) {
    isChecked = List<bool>.filled(allDataFamillyByUserId.length, false);
    idFamilly = 0;
    famillyName = null;
    Navigator.pop(context);
    notifyListeners();
  }

  changeFamillyName(String paramFamillyName) {
    famillyName = paramFamillyName;
    notifyListeners();
  }

  getAllDataArea() async {
    try {
      List<AreaModel> _allDataArea = await AreaApi().getAllDataArea();
      dataArea = _allDataArea;
      notifyListeners();
    } catch (e) {}
  }

  getDataSessionByAreaId(int paramId) async {
    print(paramId);
    List<SessionModel> _allDataSessionByAreaId =
        await SessionApi().getDataSessionByAreaId(paramId);

    dataSessionByAreaId = _allDataSessionByAreaId;
    notifyListeners();
  }

  getDetailDataSessionById(int paramId) async {
    List<dynamic> _getDetailDataSessionAndFamilly =
        await SessionApi().getDetailDataSessionById(paramId);

    DetailSessionModel _detailDataSession = _getDetailDataSessionAndFamilly[0];
    detailDataSession = _detailDataSession;

    List<FamillyModel> _allDataFamillyByUserId =
        _getDetailDataSessionAndFamilly[1];

    isChecked = List<bool>.filled(_allDataFamillyByUserId.length, false);

    allDataFamillyByUserId = _allDataFamillyByUserId;

    notifyListeners();
  }

  bookingNow(String paramIdFamilly, String paramIdSession, String paramIdUser,
      BuildContext context) async {
    int _idBooking = await BookingApi()
        .addBookingApi(paramIdFamilly, paramIdSession, paramIdUser);

    Navigator.pushNamed(context, '/Invoice', arguments: _idBooking);
  }
}
