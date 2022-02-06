import 'dart:async';
import 'package:http/http.dart' as http;

class CovidNewsApi {

  final String url = "newsapi.org";
  final String path = "/v2/everything";
  final String query = "COVID";
  final String date = "2022-02-01";
  final String sortBy = "date";
  final String apiKey = "52416b411fea44b1be07faf152d9f178";

  Future<http.Response> getCovidNews(){
    return http.get(
        Uri.https(
            url,
            path,
            {
              'q' : query,
              'from' : date,
              'sortBy' : sortBy,
              'apiKey' : apiKey
            }
        ),
      headers:  {
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      }
    );
  }
}