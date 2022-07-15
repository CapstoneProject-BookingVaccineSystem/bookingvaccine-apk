import 'dart:async';

import 'package:bookingvaccine/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () async {
        final prefs = await SharedPreferences.getInstance();
        final int? idUser = prefs.getInt('idUser');

        if (idUser == null) {
          Navigator.pushReplacementNamed(context, '/signIn');
        } else {
          Navigator.pushReplacementNamed(context, '/home');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: Center(
          child: SvgPicture.asset(
            'assets/logo.svg',
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
