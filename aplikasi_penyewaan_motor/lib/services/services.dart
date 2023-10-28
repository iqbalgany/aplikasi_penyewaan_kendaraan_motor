import 'package:aplikasi_penyewaan_motor/models/user_model.dart';
import 'package:aplikasi_penyewaan_motor/utils/constant.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<SignInModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await _dio.post(
        Urls.baseUrl + Urls.login,
        data: {
          "email": email,
          "password": password,
        },
      );

      return SignInModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
