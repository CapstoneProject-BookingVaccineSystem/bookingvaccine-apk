import 'package:bookingvaccine/model/api/area_api.dart';
import 'package:bookingvaccine/model/api/session_api.dart';
import 'package:bookingvaccine/model/area_model.dart';
import 'package:bookingvaccine/model/session_model.dart';
import 'package:flutter/material.dart';

class VaksinasiViewModel extends ChangeNotifier {
  bool clickContent = false;
  bool clickChoose = false;
  bool clickKelurahan = false;
  int indexContent = 0;
  int idContent = 0;

  List<AreaModel> dataArea = [];
  List<SessionModel> dataSessionByAreaId = [];

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

  getAllDataArea() async {
    try {
      List<AreaModel> _allDataArea = await AreaApi().getAllDataArea();
      dataArea = _allDataArea;
      notifyListeners();
    } catch (e) {}
  }

  getDataSessionByAreaId(int paramId) async {
    List<SessionModel> _allDataSessionByAreaId =
        await SessionApi().getDataSessionByAreaId(paramId);
    dataSessionByAreaId = _allDataSessionByAreaId;
    notifyListeners();
  }

  getDetailDataSessionById(int paramId) async {
    await SessionApi().getDetailDataSessionById(paramId);
  }
}
