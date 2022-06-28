import 'package:appcent_news_app/components/dbHelper.dart';
import 'package:appcent_news_app/models/news/news_data_model.dart';
import 'package:appcent_news_app/views/news/components/Button.dart';
import 'package:appcent_news_app/views/news/layouts/webView.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class DetailView extends StatefulWidget {
  const DetailView(this._dataModel, {Key? key}) : super(key: key);
  final NewsDataModel _dataModel;
  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  late DataBaseHelper _dataBaseHelper;
  IconData _iconData = Icons.favorite_border;
  @override
  void initState() {
    _dataBaseHelper = DataBaseHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () {
                  Share.share(widget._dataModel.url!);
                },
                icon: const Icon(Icons.share)),
            IconButton(
                onPressed: () {
                  _dataBaseHelper.insert(widget._dataModel);
                  _iconData = Icons.favorite;
                  setState(() {});
                },
                icon: Icon(_iconData))
          ]),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 12),
          child: Image.network(widget._dataModel.urlToImage!),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget._dataModel.title!,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.newspaper),
                  Text(widget._dataModel.author ?? '')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.date_range),
                  Text(DateTime.tryParse(widget._dataModel.publishedAt ?? '')!
                      .toLocal()
                      .toString())
                ],
              ),
            ),
          ],
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(child: Text(widget._dataModel.content!)),
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomElevetedButon(
              buttonText: widget._dataModel.source?.name ??
                  widget._dataModel.name ??
                  '',
              buttonColor: Colors.white,
              textColor: Colors.black,
              callback: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WebViewPage(widget._dataModel.url!)));
              },
              height: 40,
              width: 120),
        )
      ]),
    );
  }
}
