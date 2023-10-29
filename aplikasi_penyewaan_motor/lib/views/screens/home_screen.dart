import 'package:aplikasi_penyewaan_motor/providers/home_provider.dart';
import 'package:aplikasi_penyewaan_motor/utils/theme.dart';
import 'package:aplikasi_penyewaan_motor/views/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: false);
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
          itemCount: provider.motorcycle['motorcycleImage'].length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(7),
                padding: EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset(
                      provider.motorcycle['motorcycleImage'][index],
                      scale: 4,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          provider.motorcycle['motorcycleName'][index],
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: semiBold,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Rp ${provider.motorcycle['motorcyclePrice'][index]}',
                              style: blueTextStyle.copyWith(
                                fontWeight: semiBold,
                              ),
                            ),
                            Text(
                              'Per day',
                              style: blueTextStyle,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
