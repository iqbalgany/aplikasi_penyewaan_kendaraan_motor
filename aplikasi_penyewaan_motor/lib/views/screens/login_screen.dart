import 'package:aplikasi_penyewaan_motor/utils/theme.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey formKey = GlobalKey<FormState>();
    TextEditingController fullNameController = TextEditingController();
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          /// Title
          Container(
            margin: EdgeInsets.only(
              top: 50,
            ),
            child: Text(
              'Login',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ),

          /// Input Section
          Container(
            margin: EdgeInsets.only(
              top: 30,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultRadius),
              border: Border.all(color: kBlackColor),
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  /// Full Name Input
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Full Name',
                          style: blackTextStyle.copyWith(
                            fontWeight: semiBold,
                          ),
                        ),
                        TextFormField(
                          controller: fullNameController,
                          cursorColor: kBlueColor,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: 'Your full name',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultRadius),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultRadius),
                              borderSide: BorderSide(color: kBlueColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Email Input
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email Address',
                          style: blackTextStyle.copyWith(
                            fontWeight: semiBold,
                          ),
                        ),
                        TextFormField(
                          controller: fullNameController,
                          cursorColor: kBlueColor,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Your email address',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultRadius),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultRadius),
                              borderSide: BorderSide(color: kBlueColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Password Input
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: blackTextStyle.copyWith(
                            fontWeight: semiBold,
                          ),
                        ),
                        TextFormField(
                          controller: fullNameController,
                          cursorColor: kBlueColor,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Your password',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultRadius),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultRadius),
                              borderSide: BorderSide(color: kBlueColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Submit Button
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    decoration: BoxDecoration(
                      color: kBlueColor,
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/main-screen');
                      },
                      child: Text(
                        'Get Started',
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Terms and Conditions
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              bottom: 75,
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Terms and Conditions',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
