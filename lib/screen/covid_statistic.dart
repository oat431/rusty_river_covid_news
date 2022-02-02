import 'package:flutter/material.dart';
import 'package:rusty_river_project/component/rr_bottom_app_bar.dart';

class CovidStatistic extends StatefulWidget {
  const CovidStatistic({Key? key}) : super(key: key);

  @override
  _CovidStatisticState createState() => _CovidStatisticState();
}

class _CovidStatisticState extends State<CovidStatistic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Covid Status"),
      ),
      body: Container(),
      bottomNavigationBar: const RustyRiverBottomBar(),
    );
  }
}
