import 'package:aplikasi_penyewaan_motor/providers/motorcycle_controller.dart';
import 'package:aplikasi_penyewaan_motor/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text('History Screen'),
        centerTitle: true,
      ),
      body: Consumer<MotorcycleController>(
        builder: (context, historyProvider, child) {
          return ListView.builder(
            itemCount: historyProvider.listHistory.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: kBackgroundColor,
                    border: Border.all(
                      color: kBlueColor,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ]),
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Motorcycle       : ${historyProvider.listHistory[index].brand} ${historyProvider.listHistory[index].name}',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'Pick Up              : ${historyProvider.listHistory[index].pickUp}',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'Drop Off            : ${historyProvider.listHistory[index].dropOff}',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: 'Total Payment : Rp',
                        decimalDigits: 0,
                      ).format(historyProvider.listHistory[index].totalCost),
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
