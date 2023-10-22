import 'package:aplikasi_penyewaan_motor/views/screens/login_screen.dart';
import 'package:aplikasi_penyewaan_motor/views/screens/main_screen.dart';
import 'package:aplikasi_penyewaan_motor/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/splash-screen': (context) => SplashScreen(),
        '/login-screen': (context) => LoginScreen(),
        '/main-screen': (context) => MainScreen(),
      },
      home: SplashScreen(),
    );
  }
}
