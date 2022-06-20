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
                  Row(
                    children: [
                      Stack(
                        children: [
                          SvgPicture.asset(
                            'assets/ellipse1.svg',
                            height: 80,
                          ),
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
                        ],
                      ),
                      Text(
                        'Edit Informasi Akun',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
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
