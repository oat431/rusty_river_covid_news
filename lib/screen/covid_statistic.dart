import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rusty_river_project/model/covid_country.dart';
import 'package:rusty_river_project/model/covid_global.dart';
import 'package:rusty_river_project/service/covid_api.dart';

class CovidStatistic extends StatefulWidget {
  const CovidStatistic({Key? key}) : super(key: key);

  @override
  _CovidStatisticState createState() => _CovidStatisticState();
}

class _CovidStatisticState extends State<CovidStatistic> {
  late final CovidApi covidApi = CovidApi();
  late CovidGlobal covidGlobal;
  late List<CovidCountry> covidCountry = [];

  Future<List<CovidCountry>> getAllCovidStatus() async {
    var response = await covidApi.getCovidSummary();
    List res = json.decode(response.body)["Countries"];
    covidCountry = res.map((status) => CovidCountry.fromJson(status)).toList();
    covidGlobal = CovidGlobal.fromJson(json.decode(response.body));
    return covidCountry;
  }

  @override
  void initState() {
    super.initState();
    getAllCovidStatus();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CovidCountry>>(
      future: getAllCovidStatus(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
              child: Text("There something error with our network."));
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: covidCountry.length,
            itemBuilder: (context, i) {
              final item = covidCountry[i];
              final code = item.countryCode;
              return ListTile(
                leading: Image.network(
                  "https://flagcdn.com/w320/${code?.toLowerCase()}.png",
                  width: 50,
                  height: 50,
                ),
                title: Text("${item.country}"),
                subtitle: Text("All case : ${item.totalConfirmed}"),
                trailing: Text("today case : ${item.newConfirmed}"),
                style: ListTileStyle.drawer,
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
