import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:rusty_river_project/model/covid_articles.dart';
import 'package:rusty_river_project/service/covid_news_api.dart';

class CovidNewsProvider extends ChangeNotifier {
  late final CovidNewsApi covidNewsApi = CovidNewsApi();
  late List<CovidArticles> covidArticles = [];

  Future<List<CovidArticles>> getAllCovidArticle() async {
    var response = await covidNewsApi.getCovidNews();
    List res = json.decode(response.body)["articles"];
    covidArticles = res
        .map((covidArticles) => CovidArticles.fromJson(covidArticles))
        .toList();
    return covidArticles;
  }

  CovidNewsProvider(){
    getAllCovidArticle();
    notifyListeners();
  }

  List<CovidArticles> getCovidArticles(){
    return covidArticles;
  }




}