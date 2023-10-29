import 'dart:async';

import 'package:aplikasi_penyewaan_motor/models/user_model.dart';
import 'package:aplikasi_penyewaan_motor/services/services.dart';
import 'package:aplikasi_penyewaan_motor/utils/finite_state.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final ApiService service = ApiService();

  SignInModel? users;

  MyState myState = MyState.initial;

  Future signIn({
    required String email,
    required String password,
  }) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      users = await service.signIn(
        email: email,
        password: password,
      );

      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
      rethrow;
    }
  }

  void checkToken(BuildContext context) async {
    var preferences = await SharedPreferences.getInstance();

    if (preferences.getString('token') != null) {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, '/main-screen');
      }
    } else {
      if (context.mounted) {
        Timer(
          const Duration(seconds: 3),
          () {
            Navigator.pushReplacementNamed(context, '/sign-in-screen');
          },
        );
      }
    }
  }
}
