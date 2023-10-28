import 'package:aplikasi_penyewaan_motor/utils/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> images = [
  'assets/images/yamaha_aerox.png',
  'assets/images/yamaha_fazzio.png',
  'assets/images/yamaha_gear.png',
  'assets/images/yamaha_jupiter.png',
  'assets/images/yamaha_nmax.png',
  'assets/images/yamaha_r15.png',
  'assets/images/yamaha_r15.png',
  'assets/images/yamaha_r15.png',
  'assets/images/yamaha_r15.png',
  'assets/images/yamaha_r15.png',
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(200),
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello, \nKevin',
                              style: blackTextStyle.copyWith(
                                fontWeight: semiBold,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'What motorbike\ndo you want to rent today?',
                              style: greyTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: light,
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: kGreyColor),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/kevin_de_bruyne.png'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Image.asset(images[index]),
              );
            }),
      ),
    );
  }
}
