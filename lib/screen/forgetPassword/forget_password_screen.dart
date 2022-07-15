// ignore_for_file: file_names

import 'dart:async';
import 'package:bookingvaccine/screen/auth/auth_view_model.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
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
          top: 23,
        ),
        child: Center(
          child: Text(
            'Lupa Password?',
            style: primaryTextStyle2.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
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
          padding: const EdgeInsets.only(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Silahkan isi dengan alamat email akun anda untuk',
                style: primaryTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'mendapatkan informasi berupa pesan konfirmasi.',
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
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                style: const TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  hintText: 'Masukkan Email Anda',
                  hintStyle: greyTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
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
                    return 'Email tidak boleh kosong';
                  }
                  return null;
                },
              )
            ],
          ));
    }

    Widget submit(SignInViewModel paramValue) {
      return Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.only(
          left: 51,
          right: 51,
        ),
        child: Column(
          children: [
            GestureDetector(
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
                  Navigator.pushNamed(context, '/send-email');
                }
                Timer(
                  const Duration(milliseconds: 200),
                  () {
                    paramValue.changeClickEnter(true);
                  },
                );
              },
              child: Container(
                width: 339,
                height: 42,
                decoration: BoxDecoration(
                  color: paramValue.clickEnter == true
                      ? primaryColor2
                      : primaryColor2_1,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Kirim Konfirmasi',
                    style: secondTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  margin: const EdgeInsets.only(
                    top: 8,
                    bottom: 43,
                  ),
                  child: Text(
                    'Batal',
                    style: secondTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          title: Container(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              'Kembali',
              style: secondTextStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: SvgPicture.asset(
                'assets/arrow_left.svg',
                width: 16.23,
                height: 15.81,
              ),
              onPressed: () => Navigator.pop(context),
              padding: const EdgeInsets.only(top: 15),
            ),
          ),
          elevation: 0,
          backgroundColor: whiteColor,
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: Container(
            height: double.infinity,
            margin: const EdgeInsets.only(
              bottom: 50,
            ),
            padding: EdgeInsets.only(
              top: !_isKeyboard ? 100 : 50,
            ),
            decoration: BoxDecoration(
              color: backgroundColor2,
            ),
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
                        submit(value),
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
