import 'package:appcent_news_app/components/dbHelper.dart';
import 'package:appcent_news_app/models/news/news_data_model.dart';
import 'package:appcent_news_app/views/news/layouts/detail_page.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  late DataBaseHelper _dataBaseHelper;
  List<NewsDataModel> newsList = [];
  @override
  void initState() {
    _dataBaseHelper = DataBaseHelper();
    getNews();
    super.initState();
  }

  getNews() async {
    newsList = await _dataBaseHelper.comeNews();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: 1))),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => DetailView(newsList[index]))));
              },
              title: Text(newsList[index].title!),
              subtitle: Text(newsList[index].description!),
              trailing: newsList[index].urlToImage != null
                  ? Image.network(newsList[index].urlToImage!)
                  : const SizedBox(),
            ),
          );
        });
  }
}
