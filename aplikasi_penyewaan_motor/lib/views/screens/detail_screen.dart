import 'package:aplikasi_penyewaan_motor/providers/detail_screen_provider.dart';
import 'package:aplikasi_penyewaan_motor/utils/theme.dart';
import 'package:aplikasi_penyewaan_motor/views/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DetailScreenProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
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
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: kGreyColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => provider.selectDate(
                        context, provider.startDateController, true),
                    child: AbsorbPointer(
                      child: TextField(
                        controller: provider.startDateController,
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
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () => provider.selectDate(
                        context, provider.endDateController, false),
                    child: AbsorbPointer(
                      child: TextField(
                        controller: provider.endDateController,
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
            Container(
              padding: EdgeInsets.all(15),
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
                  Consumer<DetailScreenProvider>(
                    builder: (context, provider, child) {
                      return Text(
                        "Rp${provider.cost.toString()}",
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
                    /// Done
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ));
                    provider.startDateController.clear();
                    provider.endDateController.clear();
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
