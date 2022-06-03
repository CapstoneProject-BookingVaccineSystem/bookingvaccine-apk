import 'package:bookingvaccine/screen/auth/auth_view_model.dart';
import 'package:bookingvaccine/screen/auth/signIn_screen.dart';
import 'package:bookingvaccine/screen/auth/signUp_screen.dart';
import 'package:bookingvaccine/screen/splash_screen.dart';
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
        '/': (context) => const SplashScreen(),
        '/signIn': (context) => SignInScreen(),
        '/signUp': (context) => SignUpScreen()
      },
    );
  }
}
