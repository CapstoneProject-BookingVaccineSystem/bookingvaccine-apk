import 'dart:async';
import 'package:bookingvaccine/model/familly_model/detail_familly.dart';
import 'package:bookingvaccine/screen/familly/familly_view_model.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class EditFamillyScreen extends StatelessWidget {
  EditFamillyScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75),
          child: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: SvgPicture.asset(
                  'assets/arrow_left.svg',
                  width: 16.23,
                  height: 15.81,
                ),
                onPressed: () async {
                  var _viewModel =
                      Provider.of<FamillyViewModel>(context, listen: false);
                  _viewModel.nikC.clear();
                  _viewModel.fullNameC.clear();
                  await _viewModel.getDataFamillyByUserId(8);
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.only(top: 15),
              ),
            ),
            elevation: 0,
            backgroundColor: whiteColor,
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 19,
                right: 19,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Edit Anggota Keluarga',
                    style: primaryTextStyle2.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Tambahkan anggota keluarga untuk mempermudah pendaftaran vaksinasi keluarga anda.',
                    style: primaryTextStyle.copyWith(
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
            Consumer<FamillyViewModel>(
              builder: (context, value, child) {
                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 19,
                          right: 19,
                          top: 16,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: primaryColor2,
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              )),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'NIK',
                                style: primaryTextStyle2.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: value.nikC,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]')),
                                  LengthLimitingTextInputFormatter(16),
                                ],
                                textInputAction: TextInputAction.next,
                                style: const TextStyle(color: Colors.grey),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 2.0),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == '') {
                                    return 'Nik tidak boleh kosong';
                                  }

                                  if (value!.length < 16) {
                                    return 'Nik tidak boleh kurang dari 16';
                                  }

                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Nama Lengkap',
                                style: primaryTextStyle2.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: value.fullNameC,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'[0-9]')),
                                ],
                                textInputAction: TextInputAction.next,
                                style: const TextStyle(color: Colors.grey),
                                decoration: InputDecoration(
                                  hintStyle: greyTextStyle.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 2.0),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == '') {
                                    return 'Nama lengkap tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  value.changeClickAdd(true);
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();

                                    await value.editDataFamilly(
                                        DetailFamillyModel(
                                            nik: value.nikC.text,
                                            fullName: value.fullNameC.text,
                                            idFamily: value.idFamilly),
                                        context);
                                  }

                                  Timer(
                                    const Duration(milliseconds: 200),
                                    () {
                                      value.changeClickAdd(false);
                                    },
                                  );
                                },
                                child: Container(
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: value.clickAdd == true
                                        ? primaryColor2_1
                                        : primaryColor2,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Simpan',
                                      style: secondTextStyle.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Anda hanya bisa menambahkan sampai 8 anggota keluarga',
                        style: primaryTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
