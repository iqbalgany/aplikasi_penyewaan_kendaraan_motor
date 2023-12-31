import 'package:aplikasi_penyewaan_motor/utils/theme.dart';
import 'package:aplikasi_penyewaan_motor/views/screens/history_screen.dart';
import 'package:aplikasi_penyewaan_motor/views/screens/home_screen.dart';
import 'package:aplikasi_penyewaan_motor/views/screens/recommendation_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;

  final List<Widget> pages = <Widget>[
    const HomeScreen(),
    const HistoryScreen(),
    const RecommendationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        iconSize: 35,
        selectedItemColor: kBlueColor,
        unselectedItemColor: kBlackColor,
        backgroundColor: kWhiteColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.motorcycle_outlined),
            label: 'Recommendation',
          ),
        ],
      ),
    );
  }
}
