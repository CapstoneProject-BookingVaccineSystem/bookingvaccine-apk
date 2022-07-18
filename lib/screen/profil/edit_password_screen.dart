import 'package:bookingvaccine/model/user_model.dart';
import 'package:bookingvaccine/screen/auth/auth_view_model.dart';
import 'package:bookingvaccine/screen/profil/profil_view_model.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditPasswordScreen extends StatelessWidget {
  EditPasswordScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _viewModelValidationPassword =
        Provider.of<SignUpViewModel>(context, listen: false);
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
                            onTap: () {
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
                              'Ganti Password Anda',
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
                        'Password Lama',
                        style: primaryTextStyle2.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      TextFormField(
                        controller: paramValue.oldPassword,
                        obscureText: true,
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
                            return 'Password lama tidak boleh kosong';
                          }

                          if (value != paramValue.validatePassword) {
                            return 'Password lama salah';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Password Baru',
                        style: primaryTextStyle2.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      TextFormField(
                        controller: paramValue.newPassword,
                        obscureText: true,
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
                            return 'Password Baru tidak boleh kosong';
                          }
                          bool result = _viewModelValidationPassword
                              .validatePassword(value!);

                          if (result == false) {
                            return 'Harus ada menggunakan huruf capital dan nomor';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Konfirmasi Password Baru',
                        style: primaryTextStyle2.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      TextFormField(
                        controller: paramValue.confirmPassword,
                        obscureText: true,
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
                            return 'Password Baru tidak boleh kosong';
                          }

                          if (value != paramValue.newPassword.text) {
                            return 'Konfirmasi password berbeda dengan password baru';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
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
                                                onTap: () {},
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
                                                  await paramValue.changePasswordUserId(
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
                                                              .newPassword.text,
                                                          firstName: paramValue
                                                              .firstNameC.text,
                                                          lastName: paramValue
                                                              .lastNameC.text,
                                                          birthDate: DateTime.parse(
                                                              paramValue.date),
                                                          gender:
                                                              paramValue.gender,
                                                          email: paramValue
                                                              .user.email,
                                                          noPhone: paramValue
                                                              .user.noPhone,
                                                          roles:
                                                              paramValue.user.roles),
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
