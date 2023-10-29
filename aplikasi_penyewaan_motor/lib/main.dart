import 'package:aplikasi_penyewaan_motor/providers/home_provider.dart';
import 'package:aplikasi_penyewaan_motor/providers/sign_in_provider.dart';
import 'package:aplikasi_penyewaan_motor/views/screens/sign_in_screen.dart';
import 'package:aplikasi_penyewaan_motor/views/screens/main_screen.dart';
import 'package:aplikasi_penyewaan_motor/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/splash-screen': (context) => SplashScreen(),
          '/sign-in-screen': (context) => LoginScreen(),
          '/main-screen': (context) => MainScreen(),
        },
        home: SplashScreen(),
      ),
    );
  }
}
