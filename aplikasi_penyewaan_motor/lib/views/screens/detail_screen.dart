import 'package:aplikasi_penyewaan_motor/utils/theme.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset('assets/images/yamaha_aerox.png'),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: kGreyColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Yamaha Aerox 2023',
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
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Rp60.000 / Day',
                      style: blueTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: kGreyColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(child: Text('I')),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Motorbike owner IQBAL GANY',
                          style: blackTextStyle.copyWith(
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          'Joining since Oct 2023',
                          style: blackTextStyle,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
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
                  // Hubungi
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
              margin: EdgeInsets.symmetric(
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
                  // Hubungi
                },
                child: Text(
                  'Select Date',
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
