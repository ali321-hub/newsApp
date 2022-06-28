import 'package:appcent_news_app/controllers/news/news_controller.dart';
import 'package:appcent_news_app/models/news/news_data_model.dart';
import 'package:appcent_news_app/models/news/news_model.dart';
import 'package:appcent_news_app/views/news/layouts/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsView extends StatefulWidget {
  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  final _textcontroller = TextEditingController();
  int page = 1;
  String keyword = '';
  late List<NewsDataModel>? newsList = [];

  @override
  Widget build(BuildContext context) {
    NewsController viewController = NewsController();
    return ChangeNotifierProvider<NewsModel>(
      create: (context) => NewsModel.instance(),
      child: Consumer<NewsModel>(
        builder: (contextForProvider, viewModel, child) {
          var status = viewController.getStatus(contextForProvider);
          RenderObjectWidget view;
          status == NewsModelStatus.Loading
              ? view = const Center(
                  child: CircularProgressIndicator(),
                )
              : status == NewsModelStatus.Error
                  ? view = const Center(
                      child: Text('Hata'),
                    )
                  : view = Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: TextFormField(
                              onFieldSubmitted: (s) {
                                keyword = s;
                                getNews(contextForProvider, viewController);
                              },
                              controller: _textcontroller,
                              decoration: InputDecoration(
                                  label: const Icon(Icons.search),
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      _textcontroller.text = '';
                                    },
                                  ),
                                  border: const OutlineInputBorder(),
                                  hintText: 'type a text'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: newsList?.length ?? 0,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: const BoxDecoration(
                                      border:
                                          Border(bottom: BorderSide(width: 1))),
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) => DetailView(
                                                  newsList![index]))));
                                    },
                                    title: Text(newsList![index].title!),
                                    subtitle:
                                        Text(newsList![index].description!),
                                    trailing:
                                        newsList![index].urlToImage != null
                                            ? Image.network(
                                                newsList![index].urlToImage!)
                                            : const SizedBox(),
                                  ),
                                );
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  page != 1 ? page-- : null;
                                  getNews(contextForProvider, viewController);
                                },
                                icon: const Icon(Icons.arrow_back_ios)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(page.toString()),
                            ),
                            IconButton(
                                onPressed: () {
                                  page++;
                                  getNews(contextForProvider, viewController);
                                },
                                icon: const Icon(Icons.arrow_forward_ios))
                          ],
                        )
                      ],
                    );
          return view;
        },
      ),
    );
  }

  getNews(BuildContext context, NewsController viewController) async {
    newsList = await viewController.getter(context, keyword, page);
    setState(() {});
  }
}
