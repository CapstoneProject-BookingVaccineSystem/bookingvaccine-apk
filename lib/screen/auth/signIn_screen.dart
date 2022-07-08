// ignore_for_file: file_names

import 'dart:async';

import 'package:bookingvaccine/screen/auth/auth_view_model.dart';
import 'package:bookingvaccine/screen/auth/signUp_screen.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    Widget logo() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/logo.svg',
            width: 66.62,
            height: 81,
          ),
          const SizedBox(
            width: 21.66,
          ),
          Text(
            'Logo',
            style: secondTextStyle.copyWith(
              fontSize: 36,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }

    Widget title() {
      return Container(
        margin: const EdgeInsets.only(
          top: 11,
        ),
        child: Center(
          child: Text(
            'Halo! Selamat Datang Kembali!',
            style: primaryTextStyle2.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }

    Widget description() {
      return Container(
          margin: const EdgeInsets.only(
            top: 10,
          ),
          padding: const EdgeInsets.only(
            left: 68.5,
            right: 68.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Ikutilah vaksinasi untuk menjaga kesehatan diri anda dan keluarga.',
                style: primaryTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Silahkan masuk atau daftar terlebih dahulu untuk melanjutkan.',
                style: primaryTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ));
    }

    Widget nik(SignInViewModel paramValue) {
      return Container(
          margin: const EdgeInsets.only(
            top: 12,
          ),
          padding: const EdgeInsets.only(
            left: 34.25,
            right: 34.25,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/user.svg',
                    width: 15,
                    height: 15,
                  ),
                  const SizedBox(
                    width: 11.75,
                  ),
                  Text(
                    'NIK',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: paramValue.nikC,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  LengthLimitingTextInputFormatter(16),
                ],
                textInputAction: TextInputAction.next,
                style: const TextStyle(color: Colors.grey),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                validator: (value) {
                  if (value == '') {
                    return 'Nik tidak boleh kosong';
                  }

                  return null;
                },
              ),
            ],
          ));
    }

    Widget password(SignInViewModel paramValue) {
      return Container(
          margin: const EdgeInsets.only(
            top: 12,
          ),
          padding: const EdgeInsets.only(
            left: 34.25,
            right: 34.25,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/lock.svg',
                    width: 15,
                    height: 15,
                  ),
                  const SizedBox(
                    width: 11.75,
                  ),
                  Text(
                    'Password',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: paramValue.passwordC,
                textInputAction: TextInputAction.done,
                style: const TextStyle(color: Colors.grey),
                obscureText: paramValue.isHidden,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      onTap: () {
                        paramValue.changeIsHidden(paramValue.isHidden);
                      },
                      child: paramValue.isHidden == true
                          ? SvgPicture.asset(
                              'assets/visibility.svg',
                              width: 13.75,
                              height: 9.38,
                              fit: BoxFit.scaleDown,
                            )
                          : SvgPicture.asset(
                              'assets/visibility_off.svg',
                              width: 13.75,
                              height: 9.38,
                              fit: BoxFit.scaleDown,
                            )),
                  contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                validator: (value) {
                  if (value == '') {
                    return 'Password tidak boleh kosong';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/forget-pw');
                  },
                  child: Text(
                    'Lupa Password?',
                    style: secondTextStyle.copyWith(
                      fontSize: 10,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ));
    }

    Widget submit(SignInViewModel paramValue) {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(
          left: 51,
          right: 51,
        ),
        child: GestureDetector(
          onLongPress: () {
            paramValue.changeClickEnter(false);
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              paramValue.changeClickEnter(false);
            }
            Timer(
              const Duration(milliseconds: 200),
              () {
                paramValue.changeClickEnter(true);
              },
            );
          },
          onTap: () async {
            paramValue.changeClickEnter(false);
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              paramValue.changeClickEnter(false);
              paramValue.loginUser(
                  paramValue.nikC.text, paramValue.passwordC.text, context);
            }
            Timer(
              const Duration(milliseconds: 200),
              () {
                paramValue.changeClickEnter(true);
              },
            );
          },
          child: Container(
            width: 317,
            height: 45,
            decoration: BoxDecoration(
              color: paramValue.clickEnter == true
                  ? primaryColor2
                  : primaryColor2_1,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Masuk',
                style: secondTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget register() {
      return Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          children: [
            Text(
              'Belum punya akun?',
              style: primaryTextStyle.copyWith(
                fontSize: 10,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: SignUpScreen(),
                  ),
                );
              },
              child: Text(
                'Daftar Sekarang',
                style: secondTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: Container(
            height: double.infinity,
            margin: const EdgeInsets.only(
              bottom: 50,
            ),
            padding: EdgeInsets.only(
              top: !_isKeyboard ? 88 : 50,
            ),
            decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(105),
                )),
            child: SingleChildScrollView(
              child: Consumer<SignInViewModel>(
                builder: (context, value, child) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        if (!_isKeyboard) logo(),
                        if (!_isKeyboard) title(),
                        if (!_isKeyboard) description(),
                        nik(value),
                        password(value),
                        submit(value),
                        register(),
                      ],
                    ),
                  );
                },
              ),
            )),
      ),
    );
  }
}
