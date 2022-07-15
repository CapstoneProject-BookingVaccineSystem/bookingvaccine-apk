import 'package:bookingvaccine/model/user_model.dart';
import 'package:bookingvaccine/screen/profil/profil_view_model.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditInformasiScreen extends StatelessWidget {
  EditInformasiScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: ListView(
          children: [
            Container(
              height: 80,
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
                        height: 80,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              var _viewModel = Provider.of<ProfilViewModel>(
                                  context,
                                  listen: false);
                              await _viewModel.getDataUser();
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 30),
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
                              'Edit Informasi Akun',
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                        'Email',
                        style: primaryTextStyle2.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      TextFormField(
                        controller: paramValue.emailC,
                        style: secondTextStyle.copyWith(
                          fontSize: 14,
                        ),
                        keyboardType: TextInputType.emailAddress,
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
                            return 'Email tidak boleh kosong';
                          }
                          final bool _isValid = EmailValidator.validate(
                            value.toString(),
                          );

                          if (_isValid == false) {
                            return 'Format harus berupa email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Password',
                        style: primaryTextStyle2.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      TextFormField(
                        style: secondTextStyle.copyWith(
                          fontSize: 14,
                        ),
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: '***********',
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
                            suffixIcon: Container(
                              width: 95,
                              height: 10,
                              padding: const EdgeInsets.only(
                                bottom: 10,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/edit-password');
                                },
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: primaryColor2,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Ganti Password',
                                      style: secondTextStyle.copyWith(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'NIK',
                        style: primaryTextStyle2.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      TextFormField(
                        controller: paramValue.nikC,
                        style: secondTextStyle.copyWith(
                          fontSize: 14,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                          LengthLimitingTextInputFormatter(16),
                        ],
                        keyboardType: TextInputType.number,
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
                            return 'NIK tidak boleh kosong';
                          }

                          if (value!.length < 15) {
                            return 'NIK tidak kurang dari 16';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'No. Telp',
                        style: primaryTextStyle2.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      TextFormField(
                        controller: paramValue.phoneNumberC,
                        style: secondTextStyle.copyWith(
                          fontSize: 14,
                        ),
                        keyboardType: TextInputType.number,
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
                            return 'No. Telp tidak boleh kosong';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        onTap: () {
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
                                                  paramValue.showLoaderDialog(
                                                      context);
                                                  await paramValue.editInformationUserById(
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
                                                              .firstNameC.text,
                                                          lastName: paramValue
                                                              .lastNameC.text,
                                                          birthDate: paramValue
                                                              .user.birthDate,
                                                          gender:
                                                              paramValue.gender,
                                                          email: paramValue
                                                              .emailC.text,
                                                          noPhone: paramValue
                                                              .phoneNumberC
                                                              .text,
                                                          roles: paramValue
                                                              .user.roles),
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
                                        borderRadius: BorderRadius.circular(5),
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
        ),
      ),
    );
  }
}
