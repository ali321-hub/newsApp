import 'package:appcent_news_app/models/news/news_data_model.dart';
// import model
import 'package:appcent_news_app/models/news/news_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsController {
  NewsController();
  NewsModelStatus getStatus(BuildContext context) {
    NewsModel viewModel = Provider.of<NewsModel>(context);
    return viewModel.status;
  }

 Future<List<NewsDataModel>?> getter(
      BuildContext context, String keyword, int page) async {
    NewsModel viewModel = Provider.of<NewsModel>(context, listen: false);
    //TODO Add code here for getter

    var sonuc = await viewModel.getter(keyword, page);
    return sonuc;
  }
}
//A value of type 'List<NewsDataModel>?' can't be returned from the method 'getter' because it has a return type of 'Future<List<NewsDataModel>>?'.