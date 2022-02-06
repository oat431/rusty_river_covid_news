import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:rusty_river_project/screen/about.dart';
import 'package:rusty_river_project/screen/covid_news.dart';
import 'package:rusty_river_project/screen/covid_statistic.dart';
import 'package:rusty_river_project/screen/home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;

  final _screen = [
    const Home(),
    const CovidStatistic(),
    const CovidNews(),
    const About()
  ];

  final _title = [
    'Rusty River Covid Notification'
    ,'Covid Status',
    'Covid News',
    'About'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title[_currentIndex]),
      ),
      body: _screen[_currentIndex],
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 30.0,
        selectedColor: const Color(0xff040307),
        strokeColor: const Color(0x30040307),
        unSelectedColor: const Color(0xffacacac),
        backgroundColor: Colors.white,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(Icons.home),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.analytics_outlined),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.web_asset_sharp),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.info_outline),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
      ),
    );
  }
}
