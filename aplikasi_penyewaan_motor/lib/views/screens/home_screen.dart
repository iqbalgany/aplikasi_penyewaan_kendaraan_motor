import 'package:aplikasi_penyewaan_motor/utils/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/yamaha_aerox.png'),
                        ),
                      ),
                    ),
                    Text(
                      'Yamaha Aerox',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Rp50.000,00 / day',
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/yamaha_nmax.png'),
                        ),
                      ),
                    ),
                    Text(
                      'Yamaha Nmax',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Rp50.000,00 / day',
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/yamaha_fazzio.png'),
                        ),
                      ),
                    ),
                    Text(
                      'Yamaha Fazzio',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Rp50.000,00 / day',
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/yamaha_gear.png'),
                        ),
                      ),
                    ),
                    Text(
                      'Yamaha Gear',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Rp50.000,00 / day',
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/yamaha_jupiter.png'),
                        ),
                      ),
                    ),
                    Text(
                      'Yamaha Jupiter',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Rp50.000,00 / day',
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/yamaha_r15.png'),
                        ),
                      ),
                    ),
                    Text(
                      'Yamaha R15',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Rp50.000,00 / day',
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
    );
  }
}
