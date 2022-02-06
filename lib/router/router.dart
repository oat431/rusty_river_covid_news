import 'package:flutter/material.dart';
import 'package:rusty_river_project/screen/about.dart';
import 'package:rusty_river_project/screen/covid_news.dart';
import 'package:rusty_river_project/screen/covid_statistic.dart';
import 'package:rusty_river_project/screen/home.dart';
import 'package:rusty_river_project/screen/landing_page.dart';

class AppRouter {
  static Map<String, WidgetBuilder> initRouter() {
    return {
      '/': (BuildContext context) => const LandingPage(),
      '/home': (BuildContext context) => const Home(),
      '/covid-status': (BuildContext context) => const CovidStatistic(),
      '/covid-news': (BuildContext context) => const CovidNews(),
      '/about': (BuildContext context) => const About()
    };
  }
}