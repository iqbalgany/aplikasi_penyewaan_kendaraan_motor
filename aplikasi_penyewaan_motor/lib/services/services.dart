import 'package:aplikasi_penyewaan_motor/models/sign_in_model.dart';
import 'package:aplikasi_penyewaan_motor/utils/constant.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<SignInModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      /// membuat permintaan HTTP POST menggunakan pustaka Dio untuk mengirim data email dan password ke URL yang ditentukan
      Response response = await _dio.post(
        Urls.baseUrl + Urls.login,
        data: {
          "email": email,
          "password": password,
        },
      );

      ///  mengubah data JSON respons ke objek Dart yang dapat digunakan dalam aplikasi.
      return SignInModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
