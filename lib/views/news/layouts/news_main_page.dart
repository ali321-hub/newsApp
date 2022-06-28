import 'package:appcent_news_app/views/news/layouts/favorites_screen.dart';
import 'package:appcent_news_app/views/news/news_view.dart';
import 'package:flutter/material.dart';

class NewsMainPage extends StatefulWidget {
  const NewsMainPage({Key? key}) : super(key: key);

  @override
  State<NewsMainPage> createState() => _NewsMainPageState();
}

class _NewsMainPageState extends State<NewsMainPage> {
  int currentPage = 0;
  String appBarTitle = 'Appcent NewsApp';
  List pages = [NewsView(), const FavoritesView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          appBarTitle,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (i) {
            if (i == 0) {
              appBarTitle = 'Appcent NewsApp';
            } else {
              appBarTitle = 'Favorites';
            }
            setState(() {
              currentPage = i;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'News'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites')
          ]),
      body: SafeArea(
        child: pages[currentPage],
      ),
    );
  }
}
