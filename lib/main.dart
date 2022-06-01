import 'package:bookingvaccine/screen/auth/sigin_screen.dart';
import 'package:bookingvaccine/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SiginScreen(),
        '/sigin': (context) => const SiginScreen(),
      },
    );
  }
}
