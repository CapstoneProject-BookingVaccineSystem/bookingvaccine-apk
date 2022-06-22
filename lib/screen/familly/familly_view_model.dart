import 'package:bookingvaccine/model/familly_model/add_fimilly_model.dart';
import 'package:bookingvaccine/model/api/familly_api.dart';
import 'package:bookingvaccine/model/familly_model/detail_familly.dart';
import 'package:bookingvaccine/model/familly_model/familly_model.dart';
import 'package:bookingvaccine/screen/prompt/prompt.dart';
import 'package:flutter/cupertino.dart';

class FamillyViewModel extends ChangeNotifier {
  bool isExpaned = false;
  bool clickAdd = false;
  bool clickChange = false;
  int indexForm = 0;
  int idFamilly = 0;
  double heightDinamis = 0;

  List<FamillyModel> dataFamillyByUserId = [];

  DetailFamillyModel detailDataFamilly = DetailFamillyModel(
    idFamily: 1,
    nik: '',
    fullName: '',
  );

  TextEditingController nikC = TextEditingController();
  TextEditingController fullNameC = TextEditingController();

  void changeisExpaned(bool paramisExpaned, int paramIndexForm) {
    if (paramisExpaned == true) {
      isExpaned = false;
      indexForm = paramIndexForm;
    } else {
      isExpaned = true;
      indexForm = paramIndexForm;
    }

    notifyListeners();
  }

  changeClickAdd(bool paramClickAdd) {
    clickAdd = paramClickAdd;
    notifyListeners();
  }

  changeClickChange(bool paramClickChange) {
    clickChange = paramClickChange;
    notifyListeners();
  }

  changeHeightDinamis(double paramHeightDinamis) {
    heightDinamis = paramHeightDinamis;
    notifyListeners();
  }

  String? get errorText {
    // at any time, we can get the text from _controller.value.text
    final text = nikC.text;

    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text != '') {
      if (text.length < 16) {
        return 'Panjang NIK harus 16';
      }
    }

    // return null if the text is valid
    return null;
  }

  getDataFamillyByUserId(int paramId) async {
    List<FamillyModel> _allDataFamillyByUserId =
        await FamillyApi().getDataFamillyByUserId(paramId);

    dataFamillyByUserId = _allDataFamillyByUserId;
    notifyListeners();
  }

  getDataFamillyById(int paramId) async {
    try {
      DetailFamillyModel _detailDataFamilly =
          await FamillyApi().getDataFamillyById(paramId);

      nikC = TextEditingController(text: _detailDataFamilly.nik);
      fullNameC = TextEditingController(text: _detailDataFamilly.fullName);
      idFamilly = _detailDataFamilly.idFamily;
      notifyListeners();
    } catch (e) {}
  }

  addDataFamilly(
      AddFamillyModel paramAddFamillyModel, BuildContext paramContext) async {
    try {
      await FamillyApi().addDataFamilly(paramAddFamillyModel);
      nikC.clear();
      fullNameC.clear();
      Prompt().promptSucces(paramContext, 'Data Berhasil Ditambahkan');
    } catch (e) {}
  }

  editDataFamilly(DetailFamillyModel paramDetailFamillyModel,
      BuildContext paramContext) async {
    await FamillyApi().detailFamilly(paramDetailFamillyModel);
    Prompt().promptSucces(paramContext, 'Data Berhasil Diubah');
  }

  deletDataFamillyById(int paramId, int paramIndex) async {
    await FamillyApi().deleteDataFamillyById(paramId);
    dataFamillyByUserId.removeAt(paramIndex);
    notifyListeners();
  }
}
