import 'package:aplikasi_penyewaan_motor/controllers/open_ai_controller.dart';
import 'package:aplikasi_penyewaan_motor/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecommendationScreen extends StatefulWidget {
  const RecommendationScreen({super.key});

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  @override
  Widget build(BuildContext context) {
    final recommendationProvider =
        Provider.of<PredictionController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendations'),
        titleTextStyle: whiteTextStyle.copyWith(
          fontSize: 20,
          fontWeight: semiBold,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  /// Textfield
                  Form(
                    key: recommendationProvider.formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            'How many days do you rent a motorbike?',
                            style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        /// Day
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: recommendationProvider.dayController,
                            decoration: InputDecoration(
                              labelText: 'Day',
                              labelStyle: greyTextStyle.copyWith(
                                fontWeight: semiBold,
                              ),
                              hintText: 'Enter a day',
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
                            validator: (String? value) {
                              bool isInvalid = value == null ||
                                  value.isEmpty ||
                                  int.tryParse(value) == null;

                              if (isInvalid) {
                                return "Please enter valid number";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        /// Budget
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              recommendationProvider.currencyFormatter
                            ],
                            controller: recommendationProvider.priceController,
                            decoration: InputDecoration(
                              labelText: 'Budget',
                              labelStyle: greyTextStyle.copyWith(
                                fontWeight: semiBold,
                              ),
                              hintText: 'Enter a budget (in IDR)',
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
                            validator: (value) =>
                                value!.isEmpty ? 'Required' : null,
                          ),
                        ),

                        ///Submit Button
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            onPressed: () {
                              if (recommendationProvider.formKey.currentState!
                                  .validate()) {
                                recommendationProvider.getRecommendation(
                                  day:
                                      recommendationProvider.dayController.text,
                                  budget: recommendationProvider
                                      .currencyFormatter
                                      .getUnformattedValue()
                                      .toInt(),
                                );
                                recommendationProvider.dayController.clear();
                                recommendationProvider.priceController.clear();
                              }
                            },
                            child: Text(
                              'Get Recommendation',
                              style: whiteTextStyle.copyWith(
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Result
                  Consumer<PredictionController>(
                    builder: (context, recommendationProvider, child) {
                      return Container(
                        padding: const EdgeInsets.only(
                          bottom: 15,
                          left: 15,
                          right: 15,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: kBlueColor,
                          ),
                        ),
                        child: Text(
                            recommendationProvider.gptData?.choices[0].text ??
                                '',
                            style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                            textAlign: TextAlign.justify),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
