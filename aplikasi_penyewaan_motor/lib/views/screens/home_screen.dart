import 'package:aplikasi_penyewaan_motor/controllers/motorcycle_controller.dart';
import 'package:aplikasi_penyewaan_motor/controllers/sign_in_controller.dart';
import 'package:aplikasi_penyewaan_motor/utils/theme.dart';
import 'package:aplikasi_penyewaan_motor/views/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final motorcycleProvider =
        Provider.of<MotorcycleController>(context, listen: false);
    final signInProvider =
        Provider.of<SignInController>(context, listen: false);
    return ColorfulSafeArea(
      color: kBlueColor,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(160),
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: kBlueColor)),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
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
                            "Hello, ${signInProvider.usernameController.text}",
                            style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 10),
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
                          image: const DecorationImage(
                            image: AssetImage('assets/images/man_photo.jpg'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: motorcycleProvider.motorcycle.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      motorcycle: motorcycleProvider.motorcycle[index],
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(7),
                padding: const EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: kBlueColor),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 1,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset(
                      motorcycleProvider.motorcycle[index].image,
                      scale: 4,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${motorcycleProvider.motorcycle[index].brand}\n${motorcycleProvider.motorcycle[index].name}',
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: semiBold,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              NumberFormat.currency(
                                locale: 'id_ID',
                                symbol: 'Rp',
                                decimalDigits: 0,
                              ).format(
                                  motorcycleProvider.motorcycle[index].price),
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
