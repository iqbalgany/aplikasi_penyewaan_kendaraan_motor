import 'package:aplikasi_penyewaan_motor/models/open_ai.dart';
import 'package:aplikasi_penyewaan_motor/services/recommendation.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PredictionController extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController dayController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final CurrencyTextInputFormatter currencyFormatter =
      CurrencyTextInputFormatter(
    locale: 'id_ID',
    decimalDigits: 0,
    symbol: 'Rp',
  );

  final RecommendationService service = RecommendationService();

  GptData? gptData;

  final currency = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );

  Future<void> getRecommendation({
    required int budget,
    required String day,
  }) async {
    try {
      final motorBudget = currency.format(budget);
      notifyListeners();

      String promptData =
          'You are someone who understands motorbike rental. Please recommend me a rental motorbike along with the year of production with a budget of $motorBudget for rental in $day days, in list form';
      notifyListeners();

      gptData = await service.getRecommendation(
        promptData: promptData,
      );
      notifyListeners();
    } catch (e) {
      notifyListeners();
      rethrow;
    }
  }
}
