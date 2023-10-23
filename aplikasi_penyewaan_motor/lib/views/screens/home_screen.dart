import 'package:aplikasi_penyewaan_motor/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_penyewaan_motor/views/widgets/motorbike_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: ListView(
          shrinkWrap: true,
          children: [
            /// Header
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
                        image: AssetImage('assets/images/kevin_de_bruyne.png'),
                      ),
                    ),
                  )
                ],
              ),
            ),

            /// Motorbike List
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MotorbikeCard(
                  motorbikeImage: 'assets/images/yamaha_aerox.png',
                  motorbikaName: 'Yamaha Aerox',
                  motorbikePrice: '50.000',
                ),
                MotorbikeCard(
                  motorbikeImage: 'assets/images/yamaha_nmax.png',
                  motorbikaName: 'Yamaha Nmax',
                  motorbikePrice: '60.000',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MotorbikeCard(
                  motorbikeImage: 'assets/images/yamaha_fazzio.png',
                  motorbikaName: 'Yamaha Fazzio',
                  motorbikePrice: '30.000',
                ),
                MotorbikeCard(
                  motorbikeImage: 'assets/images/yamaha_gear.png',
                  motorbikaName: 'Yamaha Gear',
                  motorbikePrice: '40.000',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MotorbikeCard(
                  motorbikeImage: 'assets/images/yamaha_jupiter.png',
                  motorbikaName: 'Yamaha Jupiter',
                  motorbikePrice: '80.000',
                ),
                MotorbikeCard(
                  motorbikeImage: 'assets/images/yamaha_r15.png',
                  motorbikaName: 'Yamaha R15',
                  motorbikePrice: '100.000',
                ),
              ],
            ),

            // SizedBox(
            //   height: MediaQuery.of(context).size.height,
            //   width: MediaQuery.of(context).size.width,
            //   child: GridView.builder(
            //       padding: EdgeInsets.symmetric(
            //         horizontal: 20,
            //       ),
            //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //       ),
            //       shrinkWrap: true,
            //       itemCount: 6,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Card(
            //           color: Colors.amber,
            //           child: Center(child: Text('$index')),
            //         );
            //       }),
            // ),
          ],
        ),
      ),
    );
  }
}
