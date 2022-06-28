import 'dart:convert';

import 'package:appcent_news_app/models/news/news_data_model.dart';
import 'package:http/http.dart' as http;

class NewsApiClient {
  static const baseUrl = 'https://newsapi.org';
  static const apiKey = 'd4c3d00b6f7b4263a131fe641b7d2fdd';
  final http.Client _httpclient = http.Client();

  Future<List<NewsDataModel>> getNews(String keyword, int page) async {
    final getUrl = baseUrl +
        "/v2/everything?q=" +
        keyword +
        '&page=' +
        page.toString() +
        '&apiKey=' +
        apiKey;
    Uri asilurl = Uri.parse(getUrl);
    final response = await _httpclient.get(asilurl);
    if (response.statusCode != 200) {
      throw Exception('veri yok');
    }
    final gelenCevapJson = jsonDecode(response.body);
    List<NewsDataModel> news = [];

    for (var element in (gelenCevapJson['articles'] as List)) {
      news.add(NewsDataModel.fromJson(element));
    }
    return news;
  }
}
