// ignore_for_file: file_names, unused_import

import 'dart:async';
import 'package:bookingvaccine/screen/auth/auth_view_model.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SendEmailScreen extends StatelessWidget {
  const SendEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return SvgPicture.asset(
        'assets/send_email.svg',
        width: 210,
        height: 248,
      );
    }

    Widget title() {
      return Container(
        margin: const EdgeInsets.only(
          top: 23,
        ),
        child: Center(
          child: Text(
            'Silahkan Cek Email Anda',
            style: secondTextStyle.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }

    Widget description() {
      return Container(
          margin: const EdgeInsets.only(
            top: 5,
          ),
          padding: const EdgeInsets.only(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Kami telah mengirim pesan konfimasi',
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'untuk memulihkan password anda.',
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Belum menerima pesan?',
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Kirim Ulang',
                style: secondTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ));
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
            padding: const EdgeInsets.only(
              top: 30,
            ),
            decoration: BoxDecoration(
              color: backgroundColor2,
            ),
            child: Consumer<SignInViewModel>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    logo(),
                    title(),
                    description(),
                  ],
                );
              },
            )),
      ),
    );
  }
}
