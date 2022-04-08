import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:mozi_app/pages/first_page.dart';
import 'package:mozi_app/pages/fouth_page.dart';
import 'package:mozi_app/pages/second_page.dart';
import 'package:mozi_app/pages/third_page.dart';
import 'package:mozi_app/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return AnimatedBottomNavigationBar(
        splashRadius: 0,
        gapWidth: 0,
        iconSize: 24,
        activeColor: purpleColor,
        backgroundColor: const Color(0xff1D2027),
        icons: const [
          Icons.home,
          Icons.search,
          Icons.bookmark,
          Icons.person_rounded,
        ],
        activeIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return FirstPage();
        case 1:
          return SecondPage();
        case 2:
          return ThirdPage();
        case 3:
          return FourthPage();

        default:
          return FirstPage();
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xff1B1E25),
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
