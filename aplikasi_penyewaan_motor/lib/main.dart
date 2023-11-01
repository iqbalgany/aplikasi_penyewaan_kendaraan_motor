import 'package:aplikasi_penyewaan_motor/providers/motorcycle_controller.dart';
import 'package:aplikasi_penyewaan_motor/providers/open_ai_controller.dart';
import 'package:aplikasi_penyewaan_motor/providers/sign_in_controller.dart';
import 'package:aplikasi_penyewaan_motor/utils/theme.dart';
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
          create: (context) => MotorcycleController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PredictionController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: kBlueColor,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
