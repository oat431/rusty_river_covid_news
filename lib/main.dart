import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';
import 'package:rusty_river_project/router/router.dart';
import 'package:rusty_river_project/state/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CovidNewsProvider(),
      child: MaterialApp(
        title: 'Rusty River Covid Notification',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          fontFamily: "Roboto",
        ),
        routes: AppRouter.initRouter(),
        initialRoute: "/",
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: FlutterSmartDialog.init(),
      ),
    );
  }
}
