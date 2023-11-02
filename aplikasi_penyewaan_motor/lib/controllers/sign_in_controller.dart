import 'dart:async';

import 'package:aplikasi_penyewaan_motor/models/sign_in_model.dart';
import 'package:aplikasi_penyewaan_motor/services/services.dart';
import 'package:aplikasi_penyewaan_motor/utils/finite_state.dart';
import 'package:flutter/material.dart';

class SignInController extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// membuat objek
  final ApiService service = ApiService();

  SignInModel? users;

  /// Variabel myState adalah sebuah enumerasi untuk menunjukkan status saat ini dari proses autentikasi.
  MyState myState = MyState.initial;

  Future signIn({
    required String email,
    required String password,
  }) async {
    try {
      /// aplikasi sedang memmuat data
      myState = MyState.loading;
      notifyListeners();

      /// Memanggil metode signIn dari objek users, dengan memberikan alamat email dan kata sandi pengguna. Hasilnya disimpan dalam variabel users.
      users = await service.signIn(
        email: email,
        password: password,
      );

      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      ///  Jika terjadi kesalahan selama proses autentikasi
      myState = MyState.failed;
      rethrow;
    }
  }
}
