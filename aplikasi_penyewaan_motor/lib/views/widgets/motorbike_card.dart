import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class MotorbikeCard extends StatelessWidget {
  final String motorbikeImage;
  final String motorbikaName;
  final String motorbikePrice;
  const MotorbikeCard({
    super.key,
    required this.motorbikeImage,
    required this.motorbikaName,
    required this.motorbikePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(motorbikeImage),
                ),
              ),
            ),
            Text(
              motorbikaName,
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 18,
              ),
            ),
            Text(
              'Rp$motorbikePrice,00 / day',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
