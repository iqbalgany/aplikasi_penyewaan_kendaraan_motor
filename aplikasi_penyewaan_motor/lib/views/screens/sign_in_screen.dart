import 'package:aplikasi_penyewaan_motor/providers/sign_in_provider.dart';
import 'package:aplikasi_penyewaan_motor/utils/finite_state.dart';
import 'package:aplikasi_penyewaan_motor/utils/theme.dart';
import 'package:aplikasi_penyewaan_motor/views/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    final provider = Provider.of<SignInProvider>(context, listen: false);
    provider.addListener(() {
      if (provider.myState == MyState.failed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Users Doesn\'t exist!',
            ),
          ),
        );
      } else if (provider.myState == MyState.loaded) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Logged In',
            ),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignInProvider>(context, listen: false);
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
              'SignIn',
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
              key: provider.formKey,
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
                          controller: provider.fullNameController,
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
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please, fill full name field!';
                            } else {
                              return null;
                            }
                          },
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
                          controller: provider.emailController,
                          cursorColor: kBlueColor,
                          autocorrect: false,
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
                          validator: (String? value) {
                            final emailRegExp =
                                RegExp(r'\b[\w\.-]+@[\w\.-]+\.\w+\b');

                            return !emailRegExp.hasMatch(value!)
                                ? 'Please, input valid email'
                                : null;
                          },
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
                          controller: provider.passwordController,
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
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please, fill full name field!';
                            } else {
                              return null;
                            }
                          },
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
                      onPressed: () async {
                        if (provider.formKey.currentState!.validate()) {
                          provider.formKey.currentState!.save();

                          await provider.signIn(
                              email: provider.emailController.text,
                              password: provider.passwordController.text);
                        }
                      },
                      child: Consumer<SignInProvider>(
                        builder:
                            (context, provider, circularProgressIndicator) {
                          if (provider.myState == MyState.loading) {
                            return circularProgressIndicator!;
                          } else {
                            return Text(
                              'Get Started',
                              style: whiteTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: medium,
                              ),
                            );
                          }
                        },
                        child: CircularProgressIndicator(),
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