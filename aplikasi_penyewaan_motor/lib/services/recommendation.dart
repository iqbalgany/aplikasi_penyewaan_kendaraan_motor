import 'dart:convert';

import 'package:aplikasi_penyewaan_motor/models/open_ai.dart';
import 'package:aplikasi_penyewaan_motor/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class RecommendationService {
  final Dio _dio = Dio();

  Future<GptData> getRecommendation({
    required String promptData,
  }) async {
    /// Membuat objek
    /// Menghapus late (PERBAIKAN)
    GptData _gptData = GptData(
      warning: '',
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: Usage(
        promptTokens: 0,
        completionTokens: 0,
        totalTokens: 0,
      ),
    );

    try {
      final Uri url = Uri.parse('https://api.openai.com/v1/completions');

      /// Menetapkan header untuk permintaan HTTP
      final Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey',
      };

      /// Membuat data untuk permintaan POST ke API OpenAI
      final responseBody = jsonEncode(
        {
          "model": "text-davinci-003",
          "prompt": promptData,
          "temperature": 1,
          "max_tokens": 256,
          "top_p": 1,
          "frequency_penalty": 0,
          "presence_penalty": 0
        },
      );

      /// Mengirim permintaan POST ke API OpenAI
      /// Merubah menggunakan DIO (PERBAIKAN)
      final response = await _dio.postUri(
        url,
        options: Options(
          headers: headers,
        ),
        data: responseBody,
      );

      /// Jika respons berhasil, mengonversi respons JSON ke objek GptData
      /// Mengapus status code (PERBAIKAN)
      debugPrint('Success');
      _gptData = GptData.fromJson(jsonDecode(response.data));
    } catch (e) {
      debugPrint('error');

      /// melempar exception jika terjadi kesalahan
      throw Exception('Error occured when reading request');
    }
    return _gptData;
  }
}
