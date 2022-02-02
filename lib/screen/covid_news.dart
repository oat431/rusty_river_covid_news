import 'package:flutter/material.dart';
import 'package:rusty_river_project/component/rr_bottom_app_bar.dart';

class CovidNews extends StatefulWidget {
  const CovidNews({Key? key}) : super(key: key);

  @override
  _CovidNewsState createState() => _CovidNewsState();
}

class _CovidNewsState extends State<CovidNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Covid News"),
      ),
      body: Container(),
      bottomNavigationBar: const RustyRiverBottomBar(),
    );
  }
}
