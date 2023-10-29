import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  Map<String, dynamic> motorcycle = {
    'motorcycleImage': [
      'assets/images/yamaha_aerox.png',
      'assets/images/yamaha_fazzio.png',
      'assets/images/yamaha_gear.png',
      'assets/images/yamaha_jupiter.png',
      'assets/images/yamaha_nmax.png',
      'assets/images/yamaha_r15.png',
    ],
    'motorcycleName': [
      'Yamaha\nAerox',
      'Yamaha\nFazzio',
      'Yamaha\nGear',
      'Yamaha\nJupiter',
      'Yamaha\nNmax',
      'Yamaha\nR15',
    ],
    'motorcyclePrice': [
      '50.000',
      '60.000',
      '70.000',
      '80.000',
      '90.000',
      '100.000',
    ]
  };
}
