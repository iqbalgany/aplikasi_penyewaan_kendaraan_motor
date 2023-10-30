import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailScreenProvider extends ChangeNotifier {
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  int cost = 0;

  Future<void> selectDate(BuildContext context,
      TextEditingController controller, bool isStartDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      controller.text = DateFormat('EEEE, dd MMMM yyyy').format(pickedDate);

      // Calculate cost based on selected dates
      if (startDateController.text.isNotEmpty &&
          endDateController.text.isNotEmpty) {
        DateTime startDate =
            DateFormat('EEEE, dd MMMM yyyy').parse(startDateController.text);
        DateTime endDate =
            DateFormat('EEEE, dd MMMM yyyy').parse(endDateController.text);

        // Calculate number of days between two dates
        int days = endDate.difference(startDate).inDays;
        cost = days * 60000;
        notifyListeners();
      }
    }
  }
}
