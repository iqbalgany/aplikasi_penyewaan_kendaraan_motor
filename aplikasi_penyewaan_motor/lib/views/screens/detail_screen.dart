import 'package:aplikasi_penyewaan_motor/models/history_model.dart';
import 'package:aplikasi_penyewaan_motor/models/motorcycle_model.dart';
import 'package:aplikasi_penyewaan_motor/providers/history_controller.dart';
import 'package:aplikasi_penyewaan_motor/providers/motorcycle_controller.dart';
import 'package:aplikasi_penyewaan_motor/utils/theme.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final MotorcyleModel motorcycle;
  const DetailScreen({
    super.key,
    required this.motorcycle,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    final motorcycleProvider =
        Provider.of<MotorcycleController>(context, listen: false);
    motorcycleProvider.refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final motorcycleProvider =
        Provider.of<MotorcycleController>(context, listen: false);
    final historyProvider =
        Provider.of<HistoryController>(context, listen: false);
    return ColorfulSafeArea(
      color: kBlueColor,
      child: Scaffold(
        body: ListView(
          children: [
            Image.asset(widget.motorcycle.image),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: kGreyColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.motorcycle.brand} ${widget.motorcycle.name}',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'From',
                        style: blueTextStyle.copyWith(
                          fontWeight: light,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id_ID',
                          decimalDigits: 0,
                          symbol: 'Rp',
                        ).format(widget.motorcycle.price),
                        style: blueTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        ' / Day',
                        style: blueTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: kGreyColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(child: Text('I')),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hosted by IQBAL GANY',
                            style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            'Joined In Oct 2023',
                            style: blackTextStyle,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: kGreyColor),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => motorcycleProvider.selectDate(context,
                          motorcycleProvider.startDateController, true),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: motorcycleProvider.startDateController,
                          validator: (value) =>
                              value!.isEmpty ? 'Required' : null,
                          decoration: InputDecoration(
                            labelText: 'Pick Up',
                            labelStyle: blueTextStyle,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kBlueColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kBlueColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () => motorcycleProvider
                          .selectDate(context,
                              motorcycleProvider.endDateController, false)
                          .then((value) => motorcycleProvider
                              .payment(widget.motorcycle.price)),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: motorcycleProvider.endDateController,
                          validator: (value) =>
                              value!.isEmpty ? 'Required' : null,
                          decoration: InputDecoration(
                            labelText: 'Drop Off',
                            labelStyle: blueTextStyle,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kBlueColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kBlueColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: kGreyColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 18,
                    ),
                  ),
                  Consumer<MotorcycleController>(
                    builder: (context, motorcycleProvider, child) {
                      return Text(
                        NumberFormat.currency(
                          locale: 'id_ID',
                          decimalDigits: 0,
                          symbol: 'Rp',
                        ).format(motorcycleProvider.cost),
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 18,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),

        /// Bottom App Bar
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: kBlueColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    /// Contact
                  },
                  child: Text(
                    'Contact',
                    style: blueTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  color: kYellowColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    /// Done
                    if (formKey.currentState!.validate()) {
                      historyProvider.addHistory(
                        HistoryModel(
                            brand: widget.motorcycle.brand,
                            name: widget.motorcycle.name,
                            pickUp: motorcycleProvider.startDateController.text,
                            dropOff: motorcycleProvider.endDateController.text,
                            totalCost: motorcycleProvider.cost),
                      );
                    }
                    Navigator.pop(context);
                    motorcycleProvider.startDateController.clear();
                    motorcycleProvider.endDateController.clear();
                  },
                  child: Text(
                    'Done',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
