import 'package:bookingvaccine/screen/auth/auth_view_model.dart';
import 'package:bookingvaccine/screen/auth/signIn_screen.dart';
import 'package:bookingvaccine/screen/auth/signUp_screen.dart';
import 'package:bookingvaccine/screen/familly/familly_screen.dart';
import 'package:bookingvaccine/screen/familly/familly_view_model.dart';
import 'package:bookingvaccine/screen/home/home_screen.dart';
import 'package:bookingvaccine/screen/home/home_view_model.dart';
import 'package:bookingvaccine/screen/splash_screen.dart';
import 'package:bookingvaccine/screen/vaksinasi/confirm_vaksinasi_screen.dart';
import 'package:bookingvaccine/screen/vaksinasi/vaksinasi_screen.dart';
import 'package:bookingvaccine/screen/vaksinasi/vaksinasi_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SignInViewModel>(
        create: (context) => SignInViewModel(),
      ),
      ChangeNotifierProvider<SignUpViewModel>(
        create: (context) => SignUpViewModel(),
      ),
      ChangeNotifierProvider<FamillyViewModel>(
        create: (context) => FamillyViewModel(),
      ),
      ChangeNotifierProvider<VaksinasiViewModel>(
        create: (context) => VaksinasiViewModel(),
      ),
      ChangeNotifierProvider<HomeViewModel>(
        create: (context) => HomeViewModel(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const ConfirmVaksinasiScreen(),
        '/signIn': (context) => SignInScreen(),
        '/signUp': (context) => SignUpScreen(),
        '/home': (context) => const HomeScreen(),
        '/familly': (context) => FamillyScreen(),
        '/vaksinasni': (context) => const VaksinasiScreen(),
      },
    );
  }
}
