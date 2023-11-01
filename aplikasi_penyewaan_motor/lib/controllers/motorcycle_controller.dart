import 'package:aplikasi_penyewaan_motor/models/motorcycle_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MotorcycleController extends ChangeNotifier {
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  int cost = 0;
  int days = 0;

  final List<MotorcyleModel> motorcycle = [
    /// Membuat objek-objek
    MotorcyleModel(
        image: 'assets/images/yamaha_aerox.png',
        brand: 'Yamaha',
        name: 'Aerox',
        price: 50000),
    MotorcyleModel(
      image: 'assets/images/yamaha_fazzio.png',
      brand: 'Yamaha',
      name: 'Fazzio',
      price: 60000,
    ),
    MotorcyleModel(
      image: 'assets/images/yamaha_gear.png',
      brand: 'Yamaha',
      name: 'Gear',
      price: 70000,
    ),
    MotorcyleModel(
      image: 'assets/images/yamaha_jupiter.png',
      brand: 'Yamaha',
      name: 'Jupiter',
      price: 80000,
    ),
    MotorcyleModel(
      image: 'assets/images/yamaha_nmax.png',
      brand: 'Yamaha',
      name: 'Nmax',
      price: 90000,
    ),
    MotorcyleModel(
      image: 'assets/images/yamaha_r15.png',
      brand: 'Yamaha',
      name: 'R15',
      price: 100000,
    ),
    MotorcyleModel(
      image: 'assets/images/honda_beat.png',
      brand: 'Honda',
      name: 'Beat',
      price: 30000,
    ),
    MotorcyleModel(
      image: 'assets/images/honda_vario.png',
      brand: 'Honda',
      name: 'Vario',
      price: 40000,
    ),
    MotorcyleModel(
      image: 'assets/images/kawasaki_klx.png',
      brand: 'Kawasaki',
      name: 'Klx',
      price: 70000,
    ),
    MotorcyleModel(
      image: 'assets/images/kawasaki_w175.png',
      brand: 'Kawasaki',
      name: 'W175',
      price: 80000,
    ),
    MotorcyleModel(
      image: 'assets/images/vespa_s.png',
      brand: 'Vespa',
      name: 'S',
      price: 80000,
    ),
  ];

  Future<void> selectDate(BuildContext context,
      TextEditingController controller, bool isStartDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );

    /// Memeriksa apakah pengguna telah memilih tanggal
    if (pickedDate != null) {
      /// Mengatur nilai teks pada controller dengan format tanggal yang diinginkan
      controller.text = DateFormat('EEEE, dd MMMM yyyy').format(pickedDate);

      /// Menghitung biaya berdasarkan tanggal yang dipilih
      if (startDateController.text.isNotEmpty &&
          endDateController.text.isNotEmpty) {
        /// Mengonversi teks tanggal ke objek DateTime
        DateTime startDate =
            DateFormat('EEEE, dd MMMM yyyy').parse(startDateController.text);
        DateTime endDate =
            DateFormat('EEEE, dd MMMM yyyy').parse(endDateController.text);

        /// Menghitung jumlah hari antara dua tanggal
        days = endDate.difference(startDate).inDays;

        notifyListeners();
      }
    }
  }

  /// menghitung biaya total berdasarkan durasi penggunaan
  void payment(int price) {
    cost = days * price;
  }

  /// mengatur ulang nilai biaya ke 0
  void refresh() {
    cost = 0;
  }
}
