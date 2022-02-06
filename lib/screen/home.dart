import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rusty_river_project/model/covid_global.dart';
import 'package:rusty_river_project/widget/rr_info_card.dart';

import '../service/covid_api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final CovidApi covidApi = CovidApi();
  late CovidGlobal covidGlobal;

  Future<CovidGlobal> getAllCovidStatus() async {
    var response = await covidApi.getCovidSummary();
    covidGlobal = CovidGlobal.fromJson(json.decode(response.body)["Global"]);
    return covidGlobal;
  }

  @override
  void initState() {
    super.initState();
    getAllCovidStatus();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CovidGlobal>(
      future: getAllCovidStatus(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Something wrong on our network."));
        } else if (snapshot.hasData) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: MyInfoBox(
                        color: Colors.green[600],
                        title: "Total Recovered",
                        subtitle: "${covidGlobal.totalRecovered}",
                        detail:
                            "New Recover Today : ${covidGlobal.newRecovered}"),
                  ),
                ],
              ),
              Row(
                children: [
                  MyInfoBox(
                    color: Colors.black38,
                    title: "Total Death",
                    subtitle: "${covidGlobal.totalDeaths}",
                    detail: "New Death today ${covidGlobal.newDeaths}",
                  ),
                  Expanded(
                    child: MyInfoBox(
                      color: Colors.red[300],
                      title: "Total Confirmed",
                      subtitle: "${covidGlobal.totalConfirmed}",
                      detail: "New case today ${covidGlobal.newConfirmed}",
                    ),
                  ),
                ],
              )
            ],
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
