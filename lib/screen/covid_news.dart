import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rusty_river_project/component/rr_bottom_app_bar.dart';
import 'package:rusty_river_project/model/covid_articles.dart';
import 'package:rusty_river_project/service/covid_news_api.dart';
import 'package:rusty_river_project/widget/rr_card.dart';

class CovidNews extends StatefulWidget {
  const CovidNews({Key? key}) : super(key: key);

  @override
  _CovidNewsState createState() => _CovidNewsState();
}

class _CovidNewsState extends State<CovidNews> {
  late final CovidNewsApi covidNewsApi = CovidNewsApi();
  late List<CovidArticles> covidArticles = [];

  Future<String?> getAllCovidArticle() async {
    print("calling");
    var response = await covidNewsApi.getCovidNews();
    List res = json.decode(response.body)["articles"];
    covidArticles = res.map((covidArticles) => CovidArticles.fromJson(covidArticles)).toList();
  }

  @override
  void initState() {
    super.initState();
    getAllCovidArticle();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Covid News"),
      ),
      body: ListView.builder(
        itemCount: covidArticles.length,
        itemBuilder: (context,index){
          final item = covidArticles[index];
          return MyBox(
            imageUrl: item.urlToImage,
            title: item.title,
            detail: item.description,
            subtitle: item.source,
            url: item.url,
          );
        },
      ),
      bottomNavigationBar: const RustyRiverBottomBar(),
    );
  }
}
