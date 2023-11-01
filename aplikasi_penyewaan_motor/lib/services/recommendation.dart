import 'dart:convert';

import 'package:aplikasi_penyewaan_motor/models/open_ai.dart';
import 'package:aplikasi_penyewaan_motor/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecommendationService {
  Future<GptData> getRecommendation({
    required String promptData,
  }) async {
    late GptData gptData = GptData(
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
      /// Membuat URL untuk mengirim permintaan ke API OpenAI
      final Uri url = Uri.parse("https://api.openai.com/v1/completions");

      /// Menetapkan header untuk permintaan HTTP
      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey',
      };

      /// Membuat data untuk permintaan POST ke API OpenAI
      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": promptData,
        "temperature": 1,
        "max_tokens": 256,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      });

      /// Mengirim permintaan POST ke API OpenAI
      final response = await http.post(
        url,
        headers: headers,
        body: data,
      );

      /// Memeriksa status kode respons dari API
      if (response.statusCode == 200) {
        /// Jika respons berhasil, mengonversi respons JSON ke objek GptData
        gptData = GptData.fromJson(jsonDecode(response.body));
      }

      debugPrint('Success');
    } catch (e) {
      debugPrint('error');

      /// melempar exception jika terjadi kesalahan
      throw Exception('Error occured when reading request');
    }

    return gptData;
  }
}
