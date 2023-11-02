import 'package:aplikasi_penyewaan_motor/controllers/sign_in_controller.dart';
import 'package:aplikasi_penyewaan_motor/utils/finite_state.dart';
import 'package:aplikasi_penyewaan_motor/utils/theme.dart';
import 'package:aplikasi_penyewaan_motor/views/screens/main_screen.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
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
    final provider = Provider.of<SignInController>(context, listen: false);
    provider.addListener(() {
      if (provider.myState == MyState.failed) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Users Doesn\'t exist!',
            ),
          ),
        );
      } else if (provider.myState == MyState.loaded) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Logged In',
            ),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignInController>(context, listen: false);
    return ColorfulSafeArea(
      color: kBlueColor,
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            /// Title
            Container(
              margin: const EdgeInsets.only(
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
              margin: const EdgeInsets.only(
                top: 30,
              ),
              padding: const EdgeInsets.symmetric(
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
                    /// Username Input
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Username',
                            style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                          TextFormField(
                            controller: provider.usernameController,
                            autocorrect: false,
                            cursorColor: kBlueColor,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              hintText: 'Your username',
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
                                return 'Please, fill username field!';
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
                                return 'Please, fill password field!';
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
                        child: Consumer<SignInController>(
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
                          child: const CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Signup Button
            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have account?',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Sign Up',
                    style: blueTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),

            /// Terms and Conditions
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
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
      ),
    );
  }
}
