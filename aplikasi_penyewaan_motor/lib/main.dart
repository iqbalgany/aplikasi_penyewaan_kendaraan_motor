import 'package:aplikasi_penyewaan_motor/providers/detail_screen_provider.dart';
import 'package:aplikasi_penyewaan_motor/providers/home_provider.dart';
import 'package:aplikasi_penyewaan_motor/providers/sign_in_provider.dart';
import 'package:aplikasi_penyewaan_motor/utils/theme.dart';
import 'package:aplikasi_penyewaan_motor/views/screens/detail_screen.dart';
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
        ),
        ChangeNotifierProvider(
          create: (context) => DetailScreenProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: kBlueColor,
        ),
        home: DetailScreen(),
      ),
    );
  }
}
