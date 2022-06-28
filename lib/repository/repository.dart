import 'package:appcent_news_app/ApiClient/NewsApiClient.dart';
import 'package:appcent_news_app/locotor/locotor.dart';
import 'package:appcent_news_app/models/news/news_data_model.dart';
import 'package:flutter/material.dart';

class Repository {
  NewsApiClient _apiClient = getIt<NewsApiClient>();



  Future<List<NewsDataModel>> getNews(String keyword, int page) async {
    debugPrint('10');
    final articles = (await _apiClient.getNews(keyword, page));
    debugPrint('3' + articles.toString());
    return articles;
  }
}
