import 'package:flutter/material.dart';
import 'package:rusty_river_project/component/rr_bottom_app_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Container(),
      bottomNavigationBar: const RustyRiverBottomBar(),
    );
  }
}
