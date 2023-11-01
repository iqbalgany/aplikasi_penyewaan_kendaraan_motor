import 'package:aplikasi_penyewaan_motor/models/history_model.dart';
import 'package:flutter/material.dart';

class HistoryController extends ChangeNotifier {
  List<HistoryModel> listHistory = [];

  void addHistory(HistoryModel historyModel) {
    listHistory.add(historyModel);
    notifyListeners();
  }
}
