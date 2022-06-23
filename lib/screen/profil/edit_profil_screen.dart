import 'dart:io';

import 'package:bookingvaccine/component/loading_screen.dart';
import 'package:bookingvaccine/constant/state.dart';
import 'package:bookingvaccine/screen/profil/profil_view_model.dart';
import 'package:bookingvaccine/screen/prompt/prompt.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../model/user_model.dart';

// ignore: must_be_immutable
class EditProfilScreen extends StatelessWidget {
  EditProfilScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final List<String> genderItems = [
    'Laki-Laki',
    'Perempuan',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Consumer<ProfilViewModel>(builder: (context, paramValue, child) {
          String selectedValue = paramValue.gender;
          return ListView(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: primaryColor2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/ellipse1.svg',
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await paramValue.getDataUser();
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 30),
                                child: SvgPicture.asset(
                                  'assets/arrow_left.svg',
                                  width: 16.23,
                                  height: 15.81,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 30),
                              child: Text(
                                'Edit Profil',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: SvgPicture.asset(
                            'assets/ellipse2.svg',
                          ),
                        ),
                        Align(
                          child: Container(
                            height: 126,
                            width: 126,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(60),
                              image: DecorationImage(
                                image: paramValue.imageProfil != ''
                                    ? FileImage(File(paramValue.imageProfil))
                                    : const AssetImage(
                                            'assets/default_profil.png')
                                        as ImageProvider,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 90,
                                left: 80,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  paramValue.pickFile();
                                },
                                child: Container(
                                  height: 43,
                                  width: 43,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    border: Border.all(
                                      color: const Color(0xff45C2D6),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/camerra.svg',
                                      height: 17.25,
                                      width: 19.17,
                                      color: const Color(0xff4E7EA7),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 18,
                  right: 18,
                  top: 26,
                  bottom: 156,
                ),
                color: whiteColor,
                child: Consumer<ProfilViewModel>(
                    builder: (context, paramValue, child) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama Depan',
                          style: primaryTextStyle2.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        TextFormField(
                          controller: paramValue.firstNameC,
                          style: secondTextStyle.copyWith(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: secondColor,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: secondColor,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: secondColor,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == '') {
                              return 'Nama depan tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Nama Belakang',
                          style: primaryTextStyle2.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        TextFormField(
                          controller: paramValue.lastNameC,
                          style: secondTextStyle.copyWith(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: secondColor,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: secondColor,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: secondColor,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == '') {
                              return 'Nama belakang tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Tanggal Lahir',
                          style: primaryTextStyle2.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        TextFormField(
                          controller: paramValue.dateC,
                          onTap: () async {
                            DateTime? date = (await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2025)));
                            if (date != null) {
                              String dateFormat =
                                  DateFormat('yyyy-MM-dd').format(date);
                              paramValue.changeDate(dateFormat);
                            } else {
                              paramValue.changeDate(paramValue.dateC.text);
                            }
                          },
                          readOnly: true,
                          textInputAction: TextInputAction.next,
                          style: secondTextStyle.copyWith(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: secondColor,
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: secondColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: secondColor),
                            ),
                          ),
                          validator: (value) {
                            if (value == '') {
                              return 'Tanggal lahir tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Jenis Kelamin',
                          style: primaryTextStyle2.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        DropdownButtonFormField2(
                          decoration: InputDecoration(
                            //Add isDense true and zero Padding.
                            //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                            isDense: true,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: secondColor),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: secondColor),
                            ),
                            //Add more decoration as you want here
                            //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                          ),
                          isExpanded: true,
                          hint: Text(
                            paramValue.gender,
                            style: TextStyle(
                              fontSize: 14,
                              color: secondColor,
                            ),
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: secondColor,
                          ),
                          iconSize: 25,
                          buttonHeight: 40,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          items: genderItems
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: secondColor,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            value ??= paramValue.gender;

                            paramValue.changeGender(value.toString());

                            return null;
                          },
                          onChanged: (value) {
                            //Do something when changing the item if you want.
                          },
                          onSaved: (value) {
                            selectedValue = value.toString();
                          },
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              showDialog(
                                  context: context,
                                  builder: (BuildContext paramContext) {
                                    return AlertDialog(
                                      actionsPadding: EdgeInsets.zero,
                                      buttonPadding: EdgeInsets.zero,
                                      actions: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    height: 53,
                                                    color:
                                                        const Color(0xffF7F7F7),
                                                    child: Center(
                                                      child: Text(
                                                        'Kembali',
                                                        style: secondTextStyle
                                                            .copyWith(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    Navigator.pop(context);
                                                     await paramValue.editUserById(
                                                       UserModel(
                                                            createdAt: paramValue
                                                                .user.createdAt,
                                                            createdBy: paramValue
                                                                .user.createdBy,
                                                            isDeleted: paramValue
                                                                .user.isDeleted,
                                                            idUser: paramValue
                                                                .user.idUser,
                                                            username: paramValue
                                                                .nikC.text,
                                                            password: paramValue
                                                                .user.password,
                                                            firstName: paramValue
                                                                .firstNameC
                                                                .text,
                                                            lastName: paramValue
                                                                .lastNameC.text,
                                                            birthDate: DateTime.parse(
                                                                paramValue
                                                                    .date),
                                                            gender: paramValue
                                                                .gender,
                                                            email: paramValue
                                                                .user.email,
                                                            noPhone: paramValue.user.noPhone,
                                                            roles: paramValue.user.roles),
                                                        context);
                                                  },
                                                  child: Container(
                                                    height: 53,
                                                    color: primaryColor2,
                                                    child: Center(
                                                      child: Text(
                                                        'Konfirmasi',
                                                        style: secondTextStyle
                                                            .copyWith(
                                                                fontSize: 14),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ])
                                      ],
                                      content: Container(
                                        height: 185,
                                        width: 337,
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Apakah anda yakin?',
                                              textAlign: TextAlign.center,
                                              style: secondTextStyle.copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              'Data yang diubah tidak akan tersimpan.',
                                              textAlign: TextAlign.center,
                                              style: secondTextStyle.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }
                          },
                          child: Container(
                            height: 34,
                            decoration: BoxDecoration(
                              color: primaryColor2,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Simpan',
                                style: secondTextStyle.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
            ],
          );
        }),
      ),
    );
  }
}
