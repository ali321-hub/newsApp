import 'package:appcent_news_app/locotor/locotor.dart';
import 'package:appcent_news_app/models/news/news_data_model.dart';
import 'package:appcent_news_app/repository/repository.dart';
import 'package:flutter/material.dart';

enum NewsModelStatus {
  Ended,
  Loading,
  Error,
}

class NewsModel extends ChangeNotifier {
  late NewsModelStatus _status;
  late String _errorCode;
  late String _errorMessage;
  final Repository _repository = getIt<Repository>();

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  NewsModelStatus get status => _status;
  set status(NewsModelStatus newsStatus) {
    _status = newsStatus;
    print('${_status.name}statttataat');
    notifyListeners();
  }

  NewsModel();

  NewsModel.instance() {
    _status = NewsModelStatus.Ended;
  }

  Future<List<NewsDataModel>?>? getter(String keyword, int page) async {
    status = NewsModelStatus.Loading;
    List<NewsDataModel> sonuc;
    try {
      sonuc = await _repository.getNews(keyword, page);
    } catch (e) {
      _errorMessage = e.toString();
      status = NewsModelStatus.Error;
      return null;
    }

    status = NewsModelStatus.Ended;
    return sonuc;
  }
}
